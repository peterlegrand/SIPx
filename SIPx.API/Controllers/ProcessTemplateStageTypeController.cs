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
    public class ProcessTemplateStageTypeController : ControllerBase
    {
        private readonly IProcessTemplateStageTypeProvider _ProcessTemplateStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _ProjectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageTypeController(IProcessTemplateStageTypeProvider ProcessTemplateStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _ProcessTemplateStageTypeProvider = ProcessTemplateStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _ProjectProvider = ProjectProvider;
            _userManager = userManager;
        }
        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetProcessTemplateStageTypeLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetProcessTemplateStageTypeLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetProcessTemplateStageTypes()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetProcessTemplateStageType(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProcessTemplateStageTypeCreateGet = new ProcessTemplateStageTypeCreateGet();
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ProcessTemplateStageTypeCreateGet.LanguageId = UserLanguage.LanguageId;
                ProcessTemplateStageTypeCreateGet.LanguageName = UserLanguage.Name;
                return Ok(ProcessTemplateStageTypeCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateStageType.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeCreatePostCheck(ProcessTemplateStageType);
                if (CheckString.Length == 0)
                {
                    _ProcessTemplateStageTypeProvider.ProcessTemplateStageTypeCreatePost(ProcessTemplateStageType);
                    return Ok(ProcessTemplateStageType);
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