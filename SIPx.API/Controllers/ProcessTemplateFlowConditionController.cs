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
        private readonly IProcessTemplateFlowConditionComparisonOperatorProvider _processTemplateFlowConditionComparisonOperatorProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateFlowConditionTypeProvider _processTemplateFlowConditionTypeProvider;
        private readonly IProcessTemplateFlowConditionProvider _processTemplateFlowConditionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFlowConditionController(IProcessTemplateFlowConditionComparisonOperatorProvider  processTemplateFlowConditionComparisonOperatorProvider , IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateFlowConditionTypeProvider processTemplateFlowConditionTypeProvider, IProcessTemplateFlowConditionProvider processTemplateFlowConditionProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _processTemplateFlowConditionComparisonOperatorProvider = processTemplateFlowConditionComparisonOperatorProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateFlowConditionTypeProvider = processTemplateFlowConditionTypeProvider;
            _processTemplateFlowConditionProvider = processTemplateFlowConditionProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
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
                return Ok(await _processTemplateFlowConditionProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
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
                var ProcessTemplateFields = await _processTemplateFieldProvider.List(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateFlowConditionComparisonOperatorProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ProcessTemplateFlowConditionCreateGet.LanguageId = UserLanguage.LanguageId;
                ProcessTemplateFlowConditionCreateGet.LanguageName = UserLanguage.Name;
                ProcessTemplateFlowConditionCreateGet.Sequences = ProcessTemplateFlowConditionCreateGetSequences;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFlowConditionTypes = ProcessTemplateFlowConditionTypes;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFields = ProcessTemplateFields;
                ProcessTemplateFlowConditionCreateGet.ComparisonOperators = ComparisonOperators;
                ProcessTemplateFlowConditionCreateGet.ProcessTemplateFlowId = Id;
                return Ok(ProcessTemplateFlowConditionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ProcessTemplateFlowConditionCreatePost ProcessTemplateFlowCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateFlowCondition.CreaterId= CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _processTemplateFlowConditionProvider.CreatePostCheck(ProcessTemplateFlowCondition);
                if (CheckString.Length == 0)
                {
                    _processTemplateFlowConditionProvider.CreatePost(ProcessTemplateFlowCondition);
                    return Ok(ProcessTemplateFlowCondition);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
                });
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}