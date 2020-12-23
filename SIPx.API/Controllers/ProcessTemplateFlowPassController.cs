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
    public class ProcessTemplateFlowPassController : ControllerBase
    {
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IUserProvider _userProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateFlowPassComparisonOperatorProvider _processTemplateFlowPassComparisonOperatorProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateFlowPassTypeProvider _processTemplateFlowPassTypeProvider;
        private readonly IProcessTemplateFlowPassProvider _processTemplateFlowPassProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFlowPassController(IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IUserProvider userProvider, IRoleProvider roleProvider, ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProcessTemplateFlowPassComparisonOperatorProvider processTemplateFlowPassComparisonOperatorProvider, IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateFlowPassTypeProvider processTemplateFlowPassTypeProvider, IProcessTemplateFlowPassProvider processTemplateFlowPassProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _userProvider = userProvider;
            _roleProvider = roleProvider;
            _securityLevelProvider = securityLevelProvider;
            _checkProvider = checkProvider;
            _processTemplateFlowPassComparisonOperatorProvider = processTemplateFlowPassComparisonOperatorProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateFlowPassTypeProvider = processTemplateFlowPassTypeProvider;
            _processTemplateFlowPassProvider = processTemplateFlowPassProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateFlowPassCreateGet> CreateAddDropDownBoxes(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass, string UserId, int ProcessTemplateFlowId)
        {
            var ProcessTemplateFlowPassCreateGetSequences = await _processTemplateFlowPassProvider.CreateGetSequence(UserId, ProcessTemplateFlowId);
            var ProcessTemplateFlowPassTypes = await _processTemplateFlowPassTypeProvider.List(UserId);
            var ProcessTemplateFields = await _processTemplateFlowPassProvider.CreateGetFieldList(UserId, ProcessTemplateFlowId);
            var ProcessTemplateFieldRoles = await _processTemplateFlowPassProvider.CreateGetFieldRoleList(UserId, ProcessTemplateFlowId);
            var ComparisonOperators = await _processTemplateFlowPassComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var Roles = await _roleProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Users = await _userProvider.List();
            ProcessTemplateFlowPass.LanguageId = UserLanguage.LanguageId;
            ProcessTemplateFlowPass.LanguageName = UserLanguage.Name;
            ProcessTemplateFlowPass.Sequences = ProcessTemplateFlowPassCreateGetSequences;
            ProcessTemplateFlowPass.ProcessTemplateFlowPassTypes = ProcessTemplateFlowPassTypes;
            ProcessTemplateFlowPass.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
            ProcessTemplateFlowPass.ProcessTemplateFields = ProcessTemplateFields;
            ProcessTemplateFlowPass.ComparisonOperators = ComparisonOperators;
            ProcessTemplateFlowPass.ProcessTemplateFlowId = ProcessTemplateFlowId;
            ProcessTemplateFlowPass.UserId = UserId;
            ProcessTemplateFlowPass.SecurityLevels = SecurityLevels;
            ProcessTemplateFlowPass.Roles = Roles;
            ProcessTemplateFlowPass.Organizations = Organizations;
            ProcessTemplateFlowPass.Projects = Projects;
            ProcessTemplateFlowPass.Users = Users;

            return ProcessTemplateFlowPass;
        }

        private async Task<ProcessTemplateFlowPassUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass, string UserId, int ProcessTemplateFlowPassId)
        {
            var ProcessTemplateFlowPassCreateGetSequences = await _processTemplateFlowPassProvider.UpdateGetSequence(UserId, ProcessTemplateFlowPassId);
            var ProcessTemplateFlowPassTypes = await _processTemplateFlowPassTypeProvider.List(UserId);
            var ProcessTemplateFields = await _processTemplateFlowPassProvider.UpdateGetFieldList(UserId, ProcessTemplateFlowPassId);
            var ProcessTemplateFieldRoles = await _processTemplateFlowPassProvider.UpdateGetFieldRoleList(UserId, ProcessTemplateFlowPassId);
            var ComparisonOperators = await _processTemplateFlowPassComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
           ProcessTemplateFlowPass.Sequences = ProcessTemplateFlowPassCreateGetSequences;
            ProcessTemplateFlowPass.ProcessTemplateFlowPassTypes = ProcessTemplateFlowPassTypes;
            ProcessTemplateFlowPass.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
            ProcessTemplateFlowPass.ProcessTemplateFields = ProcessTemplateFields;
            ProcessTemplateFlowPass.ComparisonOperators = ComparisonOperators;
           
            return ProcessTemplateFlowPass;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateFlowPass = new ProcessTemplateFlowPassCreateGet();
                ProcessTemplateFlowPass = await CreateAddDropDownBoxes(ProcessTemplateFlowPass, CurrentUser.Id, Id);
                return Ok(ProcessTemplateFlowPass);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateFlowPass.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowPassProvider.CreatePostCheck(ProcessTemplateFlowPass);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlowPass = await CreateAddDropDownBoxes(ProcessTemplateFlowPass, CurrentUser.Id, ProcessTemplateFlowPass.ProcessTemplateFlowId);
                }
                else
                {
                    _processTemplateFlowPassProvider.CreatePost(ProcessTemplateFlowPass);
                }
                ProcessTemplateFlowPassCreateGetWithErrorMessages ProcessTemplateFlowPassWithErrorMessage = new ProcessTemplateFlowPassCreateGetWithErrorMessages { ProcessTemplateFlowPass = ProcessTemplateFlowPass, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowPassWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowPassCreateGetWithErrorMessages ProcessTemplateFlowPassWithNoRights = new ProcessTemplateFlowPassCreateGetWithErrorMessages { ProcessTemplateFlowPass = ProcessTemplateFlowPass, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowPassWithNoRights);
        }

        [HttpGet("IndexGetProcessTemplateId/{Id:int}")]
        public async Task<IActionResult> IndexGetProcessTemplateId(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowPassProvider.IndexGetProcessTemplateId(Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowPassProvider.IndexGet(CurrentUser.Id, Id));
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

                var ProcessTemplateFlowPass= await _processTemplateFlowPassProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateFlowPass = await UpdateAddDropDownBoxes(ProcessTemplateFlowPass, CurrentUser.Id, Id);

                return Ok(ProcessTemplateFlowPass);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowPassProvider.UpdatePostCheck(ProcessTemplateFlowPass);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlowPass = await UpdateAddDropDownBoxes(ProcessTemplateFlowPass, CurrentUser.Id, ProcessTemplateFlowPass.ProcessTemplateFlowPassId);
                }
                else
                {
                    _processTemplateFlowPassProvider.UpdatePost(ProcessTemplateFlowPass);
                }
                ProcessTemplateFlowPassUpdateGetWithErrorMessages ProcessTemplateFlowPassWithErrorMessage = new ProcessTemplateFlowPassUpdateGetWithErrorMessages { ProcessTemplateFlowPass = ProcessTemplateFlowPass, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowPassWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowPassUpdateGetWithErrorMessages ProcessTemplateFlowPassWithNoRights = new ProcessTemplateFlowPassUpdateGetWithErrorMessages { ProcessTemplateFlowPass = ProcessTemplateFlowPass, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowPassWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ProcessTemplateFlowPasss", "ProcessTemplateFlowPassID", Id) == 0)
                //{
                //return BadRequest(new
                //{
                //    IsSuccess = false,
                //    Message = "No record with this ID",
                //});
                //}
                var x = await _processTemplateFlowPassProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateFlowPassDeleteGet ProcessTemplateFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //                ProcessTemplateFlowPass.U = CurrentUser.Id;
                //var CheckString = await _ProcessTemplateFlowPassProvider.DeletePostCheck(ProcessTemplateFlowPass);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowPassProvider.DeletePost(ProcessTemplateFlowPass.ProcessTemplateFlowPassId);
                return Ok(ProcessTemplateFlowPass);
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
                return Ok(await _processTemplateFlowPassProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateFlowPassProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}