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

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProcessTemplateFlowConditionCreateGet = new ProcessTemplateFlowConditionCreateGet();
                var ProcessTemplateFlowConditionCreateGetSequences = await _processTemplateFlowConditionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var ProcessTemplateFlowConditionTypes = await _processTemplateFlowConditionTypeProvider.List(CurrentUser.Id);
                var ProcessTemplateFields = await _processTemplateFlowConditionProvider.CreateGetFieldList(CurrentUser.Id, Id);
                var ProcessTemplateFieldRoles = await _processTemplateFlowConditionProvider.CreateGetFieldRoleList(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateFlowConditionComparisonOperatorProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                var Roles = await _roleProvider.List(CurrentUser.Id);
                var Organizations = await _organizationProvider.List(CurrentUser.Id);
                var Projects = await _projectProvider.List(CurrentUser.Id);
                var Users = await _userProvider.List();
                ProcessTemplateFlowConditionCreateGet.LanguageId = UserLanguage.LanguageId;
                ProcessTemplateFlowConditionCreateGet.LanguageName = UserLanguage.Name;
                ProcessTemplateFlowConditionCreateGet.Sequences = ProcessTemplateFlowConditionCreateGetSequences;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFields = ProcessTemplateFields;
                ProcessTemplateFlowConditionCreateGet.ComparisonOperators = ComparisonOperators;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFlowId = Id;
                ProcessTemplateFlowConditionCreateGet.UserId = CurrentUser.Id;
                ProcessTemplateFlowConditionCreateGet.SecurityLevels = SecurityLevels;
                ProcessTemplateFlowConditionCreateGet.Roles = Roles;
                ProcessTemplateFlowConditionCreateGet.Organizations = Organizations;
                ProcessTemplateFlowConditionCreateGet.Projects = Projects;
                ProcessTemplateFlowConditionCreateGet.Users = Users;
                return Ok(ProcessTemplateFlowConditionCreateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _processTemplateFlowConditionProvider.CreatePostCheck(ProcessTemplateFlowCondition);
                //if (CheckString.Length == 0)
                //{
                    _processTemplateFlowConditionProvider.CreatePost(ProcessTemplateFlowCondition);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {

                var ProcessTemplateFlowConditionUpdateGet = await _processTemplateFlowConditionProvider.UpdateGet(CurrentUser.Id, Id);
                var ProcessTemplateFlowConditionCreateGetSequences = await _processTemplateFlowConditionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var ProcessTemplateFlowConditionTypes = await _processTemplateFlowConditionTypeProvider.List(CurrentUser.Id);
                var ProcessTemplateFields = await _processTemplateFlowConditionProvider.CreateGetFieldList(CurrentUser.Id, Id);
                var ProcessTemplateFieldRoles = await _processTemplateFlowConditionProvider.CreateGetFieldRoleList(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateFlowConditionComparisonOperatorProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                //ProcessTemplateFlowConditionUpdateGet.LanguageId = UserLanguage.LanguageId;
                //ProcessTemplateFlowConditionUpdateGet.LanguageName = UserLanguage.Name;
                ProcessTemplateFlowConditionUpdateGet.Sequences = ProcessTemplateFlowConditionCreateGetSequences;
                ProcessTemplateFlowConditionUpdateGet.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
                ProcessTemplateFlowConditionUpdateGet.ProcessTemplateFieldRoles = ProcessTemplateFieldRoles;
                ProcessTemplateFlowConditionUpdateGet.ProcessTemplateFields = ProcessTemplateFields;
                ProcessTemplateFlowConditionUpdateGet.ComparisonOperators = ComparisonOperators;
                //ProcessTemplateFlowConditionUpdateGet.ProcessTemplateFlowId = Id;


                return Ok(ProcessTemplateFlowConditionUpdateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateFlowCondition.UserId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowConditionProvider.UpdatePost(ProcessTemplateFlowCondition);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
//                ProcessTemplateFlowCondition.U = CurrentUser.Id;
                //var CheckString = await _ProcessTemplateFlowConditionProvider.DeletePostCheck(ProcessTemplateFlowCondition);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowConditionProvider.DeletePost(ProcessTemplateFlowCondition.ProcessTemplateFlowConditionId);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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