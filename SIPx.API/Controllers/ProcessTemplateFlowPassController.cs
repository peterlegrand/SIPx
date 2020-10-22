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

        public ProcessTemplateFlowPassController(IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IUserProvider userProvider , IRoleProvider roleProvider, ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProcessTemplateFlowPassComparisonOperatorProvider processTemplateFlowPassComparisonOperatorProvider , IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateFlowPassTypeProvider processTemplateFlowPassTypeProvider, IProcessTemplateFlowPassProvider processTemplateFlowPassProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
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

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProcessTemplateFlowPassCreateGet = new ProcessTemplateFlowPassCreateGet();
                var ProcessTemplateFlowPassCreateGetSequences = await _processTemplateFlowPassProvider.CreateGetSequence(CurrentUser.Id, Id);
                var ProcessTemplateFlowPassTypes = await _processTemplateFlowPassTypeProvider.List(CurrentUser.Id);
                var ProcessTemplateFields = await _processTemplateFlowPassProvider.CreateGetFieldList(CurrentUser.Id, Id);
                var ProcessTemplateFieldRoles = await _processTemplateFlowPassProvider.CreateGetFieldRoleList(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateFlowPassComparisonOperatorProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                var Roles = await _roleProvider.List(CurrentUser.Id);
                var Organizations = await _organizationProvider.List(CurrentUser.Id);
                var Projects = await _projectProvider.List(CurrentUser.Id);
                var Users = await _userProvider.List();
                ProcessTemplateFlowPassCreateGet.LanguageId = UserLanguage.LanguageId;
                ProcessTemplateFlowPassCreateGet.LanguageName = UserLanguage.Name;
                ProcessTemplateFlowPassCreateGet.Sequences = ProcessTemplateFlowPassCreateGetSequences;
                ProcessTemplateFlowPassCreateGet.ProcessTemplateFlowPassTypes = ProcessTemplateFlowPassTypes;
                ProcessTemplateFlowPassCreateGet.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
                ProcessTemplateFlowPassCreateGet.ProcessTemplateFields = ProcessTemplateFields;
                ProcessTemplateFlowPassCreateGet.ComparisonOperators = ComparisonOperators;
                ProcessTemplateFlowPassCreateGet.ProcessTemplateFlowId = Id;
                ProcessTemplateFlowPassCreateGet.UserId = CurrentUser.Id;
                ProcessTemplateFlowPassCreateGet.SecurityLevels = SecurityLevels;
                ProcessTemplateFlowPassCreateGet.Roles = Roles;
                ProcessTemplateFlowPassCreateGet.Organizations = Organizations;
                ProcessTemplateFlowPassCreateGet.Projects = Projects;
                ProcessTemplateFlowPassCreateGet.Users = Users;
                return Ok(ProcessTemplateFlowPassCreateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _processTemplateFlowPassProvider.CreatePostCheck(ProcessTemplateFlowPass);
                //if (CheckString.Length == 0)
                //{
                    _processTemplateFlowPassProvider.CreatePost(ProcessTemplateFlowPass);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {

                var ProcessTemplateFlowPassUpdateGet = await _processTemplateFlowPassProvider.UpdateGet(CurrentUser.Id, Id);
                var ProcessTemplateFlowPassCreateGetSequences = await _processTemplateFlowPassProvider.UpdateGetSequence(CurrentUser.Id, Id);
                var ProcessTemplateFlowPassTypes = await _processTemplateFlowPassTypeProvider.List(CurrentUser.Id);
                var ProcessTemplateFields = await _processTemplateFlowPassProvider.UpdateGetFieldList(CurrentUser.Id, Id);
                var ProcessTemplateFieldRoles = await _processTemplateFlowPassProvider.UpdateGetFieldRoleList(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateFlowPassComparisonOperatorProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                //ProcessTemplateFlowPassUpdateGet.LanguageId = UserLanguage.LanguageId;
                //ProcessTemplateFlowPassUpdateGet.LanguageName = UserLanguage.Name;
                ProcessTemplateFlowPassUpdateGet.Sequences = ProcessTemplateFlowPassCreateGetSequences;
                ProcessTemplateFlowPassUpdateGet.ProcessTemplateFlowPassTypes = ProcessTemplateFlowPassTypes;
                ProcessTemplateFlowPassUpdateGet.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
                ProcessTemplateFlowPassUpdateGet.ProcessTemplateFields = ProcessTemplateFields;
                ProcessTemplateFlowPassUpdateGet.ComparisonOperators = ComparisonOperators;
                //ProcessTemplateFlowPassUpdateGet.ProcessTemplateFlowId = Id;


                return Ok(ProcessTemplateFlowPassUpdateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateFlowPass.UserId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowPassProvider.UpdatePost(ProcessTemplateFlowPass);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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