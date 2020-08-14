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
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class SettingController : ControllerBase
    {
        private readonly ISettingProvider _settingProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IMasterProvider _masterProvider;
        private readonly UserManager<SipUser> _userManager;

        public SettingController(ISettingProvider settingProvider, ILanguageProvider languageProvider, IClaimCheck claimCheck, IMasterProvider masterProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _settingProvider = settingProvider;
            _languageProvider = languageProvider;
            _claimCheck = claimCheck;
            _masterProvider = masterProvider;
            _userManager = userManager;
        }

     
        [HttpGet("Index")]
        public async Task<IActionResult> GetSettings()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _settingProvider.SettingIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> SettingUpdateGet(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _settingProvider.SettingUpdateGet(CurrentUser.Id, Id);

                if (x.TypeId == 1)
                {
                    var LanguageList = await _languageProvider.LanguageList(CurrentUser.Id);
                    x.Languages = LanguageList;
                }
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}