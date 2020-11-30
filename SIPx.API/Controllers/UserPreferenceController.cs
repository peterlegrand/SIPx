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
    public class UserPreferenceController : ControllerBase
    {
        private readonly IUserPreferenceProvider _userPreferenceProvider;
        private readonly ILanguageProvider _LanguageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public UserPreferenceController(IUserPreferenceProvider userPreferenceProvider
            , ILanguageProvider LanguageProvider
            , IMasterProvider masterProvider
            , IPageProvider pageProvider
            , IClaimCheck claimCheck
            , UserManager<SipUser> userManager)
        {
            _userPreferenceProvider = userPreferenceProvider;
            _LanguageProvider = LanguageProvider;
            _masterProvider = masterProvider;
            _pageProvider = pageProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _userPreferenceProvider.IndexGet(CurrentUser.Id, CurrentUser.Id));
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
                var x = await _userPreferenceProvider.UpdateGet(CurrentUser.Id, Id);

                switch (x.PreferenceTypeId)
                {
                    case 1:
                        x.Languages = await _LanguageProvider.ActiveList(CurrentUser.Id);
                        break;
                    case 2:
                        x.Pages = await _pageProvider.ListForMenuTemplate(CurrentUser.Id);
                        break;
                }
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        
        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserPreferenceUpdateGet UserPreference)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserPreference.UserId= CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userPreferenceProvider.UpdatePostCheck(UserPreference);
                if (CheckString.Length == 0)
                {
                    _userPreferenceProvider.UpdatePost(UserPreference);
                    return Ok(UserPreference);
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