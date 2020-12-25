using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;
using SIPx.DataAccess;
namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ProcessTemplateFlowConditionController : ControllerBase
    {
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IUserProvider _userProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateFlowConditionComparisonOperatorProvider _processTemplateFlowConditionComparisonOperatorProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateFlowConditionTypeProvider _processTemplateFlowConditionTypeProvider;
        private readonly IProcessTemplateFlowConditionProvider _processTemplateFlowConditionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFlowConditionController(IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IUserProvider userProvider , IRoleProvider roleProvider, ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProcessTemplateFlowConditionComparisonOperatorProvider processTemplateFlowConditionComparisonOperatorProvider , IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateFlowConditionTypeProvider processTemplateFlowConditionTypeProvider, IProcessTemplateFlowConditionProvider processTemplateFlowConditionProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _userProvider = userProvider;
            _roleProvider = roleProvider;
            _securityLevelProvider = securityLevelProvider;
            _checkProvider = checkProvider;
            _processTemplateFlowConditionComparisonOperatorProvider = processTemplateFlowConditionComparisonOperatorProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateFlowConditionTypeProvider = processTemplateFlowConditionTypeProvider;
            _processTemplateFlowConditionProvider = processTemplateFlowConditionProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateFlowConditionCreateGet> CreateAddDropDownBoxes(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition, string UserId, int ProcessTemplateFlowId)
        {
            var ProcessTemplateFlowConditionCreateGetSequences = await _processTemplateFlowConditionProvider.CreateGetSequence(UserId, ProcessTemplateFlowId);
            var ProcessTemplateFlowConditionTypes = await _processTemplateFlowConditionTypeProvider.List(UserId);
            var ProcessTemplateFields = await _processTemplateFlowConditionProvider.CreateGetFieldList(UserId, ProcessTemplateFlowId);
            var ProcessTemplateFieldRoles = await _processTemplateFlowConditionProvider.CreateGetFieldRoleList(UserId, ProcessTemplateFlowId);
            var ComparisonOperators = await _processTemplateFlowConditionComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var Roles = await _roleProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Users = await _userProvider.List();
            ProcessTemplateFlowCondition.LanguageId = UserLanguage.LanguageId;
            ProcessTemplateFlowCondition.LanguageName = UserLanguage.Name;
            ProcessTemplateFlowCondition.Sequences = ProcessTemplateFlowConditionCreateGetSequences;
            ProcessTemplateFlowCondition.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
            ProcessTemplateFlowCondition.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
            ProcessTemplateFlowCondition.ProcessTemplateFields = ProcessTemplateFields;
            ProcessTemplateFlowCondition.ComparisonOperators = ComparisonOperators;
            ProcessTemplateFlowCondition.ProcessTemplateFlowId = ProcessTemplateFlowId;
            ProcessTemplateFlowCondition.UserId = UserId;
            ProcessTemplateFlowCondition.SecurityLevels = SecurityLevels;
            ProcessTemplateFlowCondition.Roles = Roles;
            ProcessTemplateFlowCondition.Organizations = Organizations;
            ProcessTemplateFlowCondition.Projects = Projects;
            ProcessTemplateFlowCondition.Users = Users;
            return ProcessTemplateFlowCondition;
        }

        private async Task<ProcessTemplateFlowConditionUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition, string UserId, int ProcessTemplateFlowConditionId)
        {
            var ProcessTemplateFlowConditionCreateGetSequences = await _processTemplateFlowConditionProvider.UpdateGetSequence(UserId, ProcessTemplateFlowConditionId);
            var ProcessTemplateFlowConditionTypes = await _processTemplateFlowConditionTypeProvider.List(UserId);
            var ProcessTemplateFields = await _processTemplateFlowConditionProvider.UpdateGetFieldList(UserId, ProcessTemplateFlowConditionId);
            var ProcessTemplateFieldRoles = await _processTemplateFlowConditionProvider.UpdateGetFieldRoleList(UserId, ProcessTemplateFlowConditionId);
            var ComparisonOperators = await _processTemplateFlowConditionComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTemplateFlowCondition.Sequences = ProcessTemplateFlowConditionCreateGetSequences;
            ProcessTemplateFlowCondition.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
            ProcessTemplateFlowCondition.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
            ProcessTemplateFlowCondition.ProcessTemplateFields = ProcessTemplateFields;
            ProcessTemplateFlowCondition.ComparisonOperators = ComparisonOperators;
            
            return ProcessTemplateFlowCondition;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateFlowCondition = new ProcessTemplateFlowConditionCreateGet();
                ProcessTemplateFlowCondition = await CreateAddDropDownBoxes(ProcessTemplateFlowCondition, CurrentUser.Id, Id);
                return Ok(ProcessTemplateFlowCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateFlowCondition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowConditionProvider.CreatePostCheck(ProcessTemplateFlowCondition);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlowCondition = await CreateAddDropDownBoxes(ProcessTemplateFlowCondition, CurrentUser.Id, ProcessTemplateFlowCondition.ProcessTemplateFlowId);
                }
                else
                {
                    _processTemplateFlowConditionProvider.CreatePost(ProcessTemplateFlowCondition);
                }
                ProcessTemplateFlowConditionCreateGetWithErrorMessages ProcessTemplateFlowConditionWithErrorMessage = new ProcessTemplateFlowConditionCreateGetWithErrorMessages { ProcessTemplateFlowCondition = ProcessTemplateFlowCondition, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowConditionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowConditionCreateGetWithErrorMessages ProcessTemplateFlowConditionWithNoRights = new ProcessTemplateFlowConditionCreateGetWithErrorMessages { ProcessTemplateFlowCondition = ProcessTemplateFlowCondition, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowConditionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowConditionProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
var ProcessTemplateFlowCondition = await _processTemplateFlowConditionProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateFlowCondition = await UpdateAddDropDownBoxes(ProcessTemplateFlowCondition, CurrentUser.Id, Id);
                return Ok(ProcessTemplateFlowCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowConditionProvider.UpdatePostCheck(ProcessTemplateFlowCondition);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlowCondition = await UpdateAddDropDownBoxes(ProcessTemplateFlowCondition, CurrentUser.Id, ProcessTemplateFlowCondition.ProcessTemplateFlowConditionId);
                }
                else
                {
                    _processTemplateFlowConditionProvider.UpdatePost(ProcessTemplateFlowCondition);
                }
                ProcessTemplateFlowConditionUpdateGetWithErrorMessages ProcessTemplateFlowConditionWithErrorMessage = new ProcessTemplateFlowConditionUpdateGetWithErrorMessages { ProcessTemplateFlowCondition = ProcessTemplateFlowCondition, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowConditionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowConditionUpdateGetWithErrorMessages ProcessTemplateFlowConditionWithNoRights = new ProcessTemplateFlowConditionUpdateGetWithErrorMessages { ProcessTemplateFlowCondition = ProcessTemplateFlowCondition, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowConditionWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ProcessTemplateFlowConditions", "ProcessTemplateFlowConditionID", Id) == 0)
                //{
                    //return BadRequest(new
                    //{
                    //    IsSuccess = false,
                    //    Message = "No record with this ID",
                    //});
                //}
                var x = await _processTemplateFlowConditionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateFlowConditionDeleteGet ProcessTemplateFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
//                ProcessTemplateFlowCondition.U = CurrentUser.Id;
                //var CheckString = await _ProcessTemplateFlowConditionProvider.DeletePostCheck(ProcessTemplateFlowCondition);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowConditionProvider.DeletePost(CurrentUser.Id, ProcessTemplateFlowCondition.ProcessTemplateFlowConditionId);
                return Ok(ProcessTemplateFlowCondition);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });


        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowConditionProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowConditionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}