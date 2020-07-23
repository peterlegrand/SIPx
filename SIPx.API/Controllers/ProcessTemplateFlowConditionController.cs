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
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFlowConditionController(IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
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
                return Ok(await _processTemplateProvider.ProcessTemplateFlowConditionLanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateProvider.ProcessTemplateFlowConditionLanguageUpdateGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateProvider.ProcessTemplateFlowConditionIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateProvider.ProcessTemplateFlowConditionUpdateGet(CurrentUser.Id, Id));
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
                var ProcessTemplateFlowConditionCreateGetSequences = await _processTemplateProvider.ProcessTemplateFlowConditionCreateGetSequence(CurrentUser.Id, Id);
                var ProcessTemplateFlowConditionTypes = await _processTemplateProvider.ProcessTemplateFlowConditionTypeList(CurrentUser.Id);
                var ProcessTemplateFields = await _processTemplateProvider.ProcessTemplateFieldList(CurrentUser.Id, Id);
                var ComparisonOperators = await _processTemplateProvider.ComparisonOperatorList(CurrentUser.Id);
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
                var CheckString = await _processTemplateProvider.ProcessTemplateFlowConditionCreatePostCheck(ProcessTemplateFlowCondition);
                if (CheckString.Length == 0)
                {
                    _processTemplateProvider.ProcessTemplateFlowConditionCreatePost(ProcessTemplateFlowCondition);
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