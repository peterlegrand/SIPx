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
    public class ProcessTypeFlowConditionController : ControllerBase
    {
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IUserProvider _userProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeFlowConditionComparisonOperatorProvider _processTypeFlowConditionComparisonOperatorProvider;
        private readonly IProcessTypeFieldProvider _processTypeFieldProvider;
        private readonly IProcessTypeFlowConditionTypeProvider _processTypeFlowConditionTypeProvider;
        private readonly IProcessTypeFlowConditionProvider _processTypeFlowConditionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeFlowConditionController(IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IUserProvider userProvider , IRoleProvider roleProvider, ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProcessTypeFlowConditionComparisonOperatorProvider processTypeFlowConditionComparisonOperatorProvider , IProcessTypeFieldProvider processTypeFieldProvider, IProcessTypeFlowConditionTypeProvider processTypeFlowConditionTypeProvider, IProcessTypeFlowConditionProvider processTypeFlowConditionProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _userProvider = userProvider;
            _roleProvider = roleProvider;
            _securityLevelProvider = securityLevelProvider;
            _checkProvider = checkProvider;
            _processTypeFlowConditionComparisonOperatorProvider = processTypeFlowConditionComparisonOperatorProvider;
            _processTypeFieldProvider = processTypeFieldProvider;
            _processTypeFlowConditionTypeProvider = processTypeFlowConditionTypeProvider;
            _processTypeFlowConditionProvider = processTypeFlowConditionProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeFlowConditionCreateGet> CreateAddDropDownBoxes(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition, string UserId, int ProcessTypeFlowId)
        {
            var ProcessTypeFlowConditionCreateGetSequences = await _processTypeFlowConditionProvider.CreateGetSequence(UserId, ProcessTypeFlowId);
            var ProcessTypeFlowConditionTypes = await _processTypeFlowConditionTypeProvider.List(UserId);
            var ProcessTypeFields = await _processTypeFlowConditionProvider.CreateGetFieldList(UserId, ProcessTypeFlowId);
            var ProcessTypeFieldRoles = await _processTypeFlowConditionProvider.CreateGetFieldRoleList(UserId, ProcessTypeFlowId);
            var ComparisonOperators = await _processTypeFlowConditionComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var Roles = await _roleProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Users = await _userProvider.List();
            ProcessTypeFlowCondition.LanguageId = UserLanguage.LanguageId;
            ProcessTypeFlowCondition.LanguageName = UserLanguage.Name;
            ProcessTypeFlowCondition.Sequences = ProcessTypeFlowConditionCreateGetSequences;
            ProcessTypeFlowCondition.ProcessTypeFlowConditionTypes = ProcessTypeFlowConditionTypes;
            ProcessTypeFlowCondition.ProcessTypeFieldRoles = ProcessTypeFieldRoles;
            ProcessTypeFlowCondition.ProcessTypeFields = ProcessTypeFields;
            ProcessTypeFlowCondition.ComparisonOperators = ComparisonOperators;
            ProcessTypeFlowCondition.ProcessTypeFlowId = ProcessTypeFlowId;
            ProcessTypeFlowCondition.UserId = UserId;
            ProcessTypeFlowCondition.SecurityLevels = SecurityLevels;
            ProcessTypeFlowCondition.Roles = Roles;
            ProcessTypeFlowCondition.Organizations = Organizations;
            ProcessTypeFlowCondition.Projects = Projects;
            ProcessTypeFlowCondition.Users = Users;
            return ProcessTypeFlowCondition;
        }

        private async Task<ProcessTypeFlowConditionUpdateGet> UpdateAddDropDownBoxes(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition, string UserId, int ProcessTypeFlowConditionId)
        {
            var ProcessTypeFlowConditionCreateGetSequences = await _processTypeFlowConditionProvider.UpdateGetSequence(UserId, ProcessTypeFlowConditionId);
            var ProcessTypeFlowConditionTypes = await _processTypeFlowConditionTypeProvider.List(UserId);
            var ProcessTypeFields = await _processTypeFlowConditionProvider.UpdateGetFieldList(UserId, ProcessTypeFlowConditionId);
            var ProcessTypeFieldRoles = await _processTypeFlowConditionProvider.UpdateGetFieldRoleList(UserId, ProcessTypeFlowConditionId);
            var ComparisonOperators = await _processTypeFlowConditionComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTypeFlowCondition.Sequences = ProcessTypeFlowConditionCreateGetSequences;
            ProcessTypeFlowCondition.ProcessTypeFlowConditionTypes = ProcessTypeFlowConditionTypes;
            ProcessTypeFlowCondition.ProcessTypeFieldRoles = ProcessTypeFieldRoles;
            ProcessTypeFlowCondition.ProcessTypeFields = ProcessTypeFields;
            ProcessTypeFlowCondition.ComparisonOperators = ComparisonOperators;
            
            return ProcessTypeFlowCondition;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeFlowCondition = new ProcessTypeFlowConditionCreateGet();
                ProcessTypeFlowCondition = await CreateAddDropDownBoxes(ProcessTypeFlowCondition, CurrentUser.Id, Id);
                return Ok(ProcessTypeFlowCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeFlowCondition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowConditionProvider.CreatePostCheck(ProcessTypeFlowCondition);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlowCondition = await CreateAddDropDownBoxes(ProcessTypeFlowCondition, CurrentUser.Id, ProcessTypeFlowCondition.ProcessTypeFlowId);
                }
                else
                {
                    _processTypeFlowConditionProvider.CreatePost(ProcessTypeFlowCondition);
                }
                ProcessTypeFlowConditionCreateGetWithErrorMessages ProcessTypeFlowConditionWithErrorMessage = new ProcessTypeFlowConditionCreateGetWithErrorMessages { ProcessTypeFlowCondition = ProcessTypeFlowCondition, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowConditionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowConditionCreateGetWithErrorMessages ProcessTypeFlowConditionWithNoRights = new ProcessTypeFlowConditionCreateGetWithErrorMessages { ProcessTypeFlowCondition = ProcessTypeFlowCondition, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowConditionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFlowConditionProvider.IndexGet(CurrentUser.Id, Id));
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
var ProcessTypeFlowCondition = await _processTypeFlowConditionProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeFlowCondition = await UpdateAddDropDownBoxes(ProcessTypeFlowCondition, CurrentUser.Id, Id);
                return Ok(ProcessTypeFlowCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowConditionProvider.UpdatePostCheck(ProcessTypeFlowCondition);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlowCondition = await UpdateAddDropDownBoxes(ProcessTypeFlowCondition, CurrentUser.Id, ProcessTypeFlowCondition.ProcessTypeFlowConditionId);
                }
                else
                {
                    _processTypeFlowConditionProvider.UpdatePost(ProcessTypeFlowCondition);
                }
                ProcessTypeFlowConditionUpdateGetWithErrorMessages ProcessTypeFlowConditionWithErrorMessage = new ProcessTypeFlowConditionUpdateGetWithErrorMessages { ProcessTypeFlowCondition = ProcessTypeFlowCondition, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowConditionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowConditionUpdateGetWithErrorMessages ProcessTypeFlowConditionWithNoRights = new ProcessTypeFlowConditionUpdateGetWithErrorMessages { ProcessTypeFlowCondition = ProcessTypeFlowCondition, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowConditionWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ProcessTypeFlowConditions", "ProcessTypeFlowConditionID", Id) == 0)
                //{
                    //return BadRequest(new
                    //{
                    //    IsSuccess = false,
                    //    Message = "No record with this ID",
                    //});
                //}
                var x = await _processTypeFlowConditionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeFlowConditionDeleteGet ProcessTypeFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
//                ProcessTypeFlowCondition.U = CurrentUser.Id;
                //var CheckString = await _ProcessTypeFlowConditionProvider.DeletePostCheck(ProcessTypeFlowCondition);
                //if (CheckString.Length == 0)
                //{
                _processTypeFlowConditionProvider.DeletePost(CurrentUser.Id, ProcessTypeFlowCondition.ProcessTypeFlowConditionId);
                return Ok(ProcessTypeFlowCondition);
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
                return Ok(await _processTypeFlowConditionProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeFlowConditionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}