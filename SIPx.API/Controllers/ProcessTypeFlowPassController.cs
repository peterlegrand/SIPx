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
    public class ProcessTypeFlowPassController : ControllerBase
    {
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IUserProvider _userProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeFlowPassComparisonOperatorProvider _processTypeFlowPassComparisonOperatorProvider;
        private readonly IProcessTypeFieldProvider _processTypeFieldProvider;
        private readonly IProcessTypeFlowPassTypeProvider _processTypeFlowPassTypeProvider;
        private readonly IProcessTypeFlowPassProvider _processTypeFlowPassProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeFlowPassController(IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IUserProvider userProvider, IRoleProvider roleProvider, ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProcessTypeFlowPassComparisonOperatorProvider processTypeFlowPassComparisonOperatorProvider, IProcessTypeFieldProvider processTypeFieldProvider, IProcessTypeFlowPassTypeProvider processTypeFlowPassTypeProvider, IProcessTypeFlowPassProvider processTypeFlowPassProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _userProvider = userProvider;
            _roleProvider = roleProvider;
            _securityLevelProvider = securityLevelProvider;
            _checkProvider = checkProvider;
            _processTypeFlowPassComparisonOperatorProvider = processTypeFlowPassComparisonOperatorProvider;
            _processTypeFieldProvider = processTypeFieldProvider;
            _processTypeFlowPassTypeProvider = processTypeFlowPassTypeProvider;
            _processTypeFlowPassProvider = processTypeFlowPassProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeFlowPassCreateGet> CreateAddDropDownBoxes(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass, string UserId, int ProcessTypeFlowId)
        {
            var ProcessTypeFlowPassCreateGetSequences = await _processTypeFlowPassProvider.CreateGetSequence(UserId, ProcessTypeFlowId);
            var ProcessTypeFlowPassTypes = await _processTypeFlowPassTypeProvider.List(UserId);
            var ProcessTypeFields = await _processTypeFlowPassProvider.CreateGetFieldList(UserId, ProcessTypeFlowId);
            var ProcessTypeFieldRoles = await _processTypeFlowPassProvider.CreateGetFieldRoleList(UserId, ProcessTypeFlowId);
            var ComparisonOperators = await _processTypeFlowPassComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var Roles = await _roleProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Users = await _userProvider.List();
            ProcessTypeFlowPass.LanguageId = UserLanguage.LanguageId;
            ProcessTypeFlowPass.LanguageName = UserLanguage.Name;
            ProcessTypeFlowPass.Sequences = ProcessTypeFlowPassCreateGetSequences;
            ProcessTypeFlowPass.ProcessTypeFlowPassTypes = ProcessTypeFlowPassTypes;
            ProcessTypeFlowPass.ProcessTypeFieldRoles = ProcessTypeFieldRoles;
            ProcessTypeFlowPass.ProcessTypeFields = ProcessTypeFields;
            ProcessTypeFlowPass.ComparisonOperators = ComparisonOperators;
            ProcessTypeFlowPass.ProcessTypeFlowId = ProcessTypeFlowId;
            ProcessTypeFlowPass.UserId = UserId;
            ProcessTypeFlowPass.SecurityLevels = SecurityLevels;
            ProcessTypeFlowPass.Roles = Roles;
            ProcessTypeFlowPass.Organizations = Organizations;
            ProcessTypeFlowPass.Projects = Projects;
            ProcessTypeFlowPass.Users = Users;

            return ProcessTypeFlowPass;
        }

        private async Task<ProcessTypeFlowPassUpdateGet> UpdateAddDropDownBoxes(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass, string UserId, int ProcessTypeFlowPassId)
        {
            var ProcessTypeFlowPassCreateGetSequences = await _processTypeFlowPassProvider.UpdateGetSequence(UserId, ProcessTypeFlowPassId);
            var ProcessTypeFlowPassTypes = await _processTypeFlowPassTypeProvider.List(UserId);
            var ProcessTypeFields = await _processTypeFlowPassProvider.UpdateGetFieldList(UserId, ProcessTypeFlowPassId);
            var ProcessTypeFieldRoles = await _processTypeFlowPassProvider.UpdateGetFieldRoleList(UserId, ProcessTypeFlowPassId);
            var ComparisonOperators = await _processTypeFlowPassComparisonOperatorProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
           ProcessTypeFlowPass.Sequences = ProcessTypeFlowPassCreateGetSequences;
            ProcessTypeFlowPass.ProcessTypeFlowPassTypes = ProcessTypeFlowPassTypes;
            ProcessTypeFlowPass.ProcessTypeFieldRoles = ProcessTypeFieldRoles;
            ProcessTypeFlowPass.ProcessTypeFields = ProcessTypeFields;
            ProcessTypeFlowPass.ComparisonOperators = ComparisonOperators;
           
            return ProcessTypeFlowPass;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeFlowPass = new ProcessTypeFlowPassCreateGet();
                ProcessTypeFlowPass = await CreateAddDropDownBoxes(ProcessTypeFlowPass, CurrentUser.Id, Id);
                return Ok(ProcessTypeFlowPass);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeFlowPass.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowPassProvider.CreatePostCheck(ProcessTypeFlowPass);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlowPass = await CreateAddDropDownBoxes(ProcessTypeFlowPass, CurrentUser.Id, ProcessTypeFlowPass.ProcessTypeFlowId);
                }
                else
                {
                    _processTypeFlowPassProvider.CreatePost(ProcessTypeFlowPass);
                }
                ProcessTypeFlowPassCreateGetWithErrorMessages ProcessTypeFlowPassWithErrorMessage = new ProcessTypeFlowPassCreateGetWithErrorMessages { ProcessTypeFlowPass = ProcessTypeFlowPass, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowPassWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowPassCreateGetWithErrorMessages ProcessTypeFlowPassWithNoRights = new ProcessTypeFlowPassCreateGetWithErrorMessages { ProcessTypeFlowPass = ProcessTypeFlowPass, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowPassWithNoRights);
        }

        [HttpGet("IndexGetProcessTypeId/{Id:int}")]
        public async Task<IActionResult> IndexGetProcessTypeId(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFlowPassProvider.IndexGetProcessTypeId(Id));
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
                return Ok(await _processTypeFlowPassProvider.IndexGet(CurrentUser.Id, Id));
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

                var ProcessTypeFlowPass= await _processTypeFlowPassProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeFlowPass = await UpdateAddDropDownBoxes(ProcessTypeFlowPass, CurrentUser.Id, Id);

                return Ok(ProcessTypeFlowPass);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowPassProvider.UpdatePostCheck(ProcessTypeFlowPass);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlowPass = await UpdateAddDropDownBoxes(ProcessTypeFlowPass, CurrentUser.Id, ProcessTypeFlowPass.ProcessTypeFlowPassId);
                }
                else
                {
                    _processTypeFlowPassProvider.UpdatePost(ProcessTypeFlowPass);
                }
                ProcessTypeFlowPassUpdateGetWithErrorMessages ProcessTypeFlowPassWithErrorMessage = new ProcessTypeFlowPassUpdateGetWithErrorMessages { ProcessTypeFlowPass = ProcessTypeFlowPass, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowPassWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowPassUpdateGetWithErrorMessages ProcessTypeFlowPassWithNoRights = new ProcessTypeFlowPassUpdateGetWithErrorMessages { ProcessTypeFlowPass = ProcessTypeFlowPass, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowPassWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ProcessTypeFlowPasss", "ProcessTypeFlowPassID", Id) == 0)
                //{
                //return BadRequest(new
                //{
                //    IsSuccess = false,
                //    Message = "No record with this ID",
                //});
                //}
                var x = await _processTypeFlowPassProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeFlowPassDeleteGet ProcessTypeFlowPass)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //                ProcessTypeFlowPass.U = CurrentUser.Id;
                //var CheckString = await _ProcessTypeFlowPassProvider.DeletePostCheck(ProcessTypeFlowPass);
                //if (CheckString.Length == 0)
                //{
                _processTypeFlowPassProvider.DeletePost(CurrentUser.Id, ProcessTypeFlowPass.ProcessTypeFlowPassId);
                return Ok(ProcessTypeFlowPass);
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
                return Ok(await _processTypeFlowPassProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeFlowPassProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}