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
        private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserPreferenceController(IUserPreferenceProvider userPreferenceProvider
            , ILanguageProvider LanguageProvider
            , IMasterProvider masterProvider
            , IPageProvider pageProvider
            , IClaimCheck claimCheck
            , IPeopleProvider peopleProvider
            , UserManager<SipUser> userManager)
        {
            _userPreferenceProvider = userPreferenceProvider;
            _LanguageProvider = LanguageProvider;
            _masterProvider = masterProvider;
            _pageProvider = pageProvider;
            _claimCheck = claimCheck;
            _peopleProvider = peopleProvider;
            _userManager = userManager;
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetUserPreferences()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _userPreferenceProvider.UserPreferenceIndexGet(CurrentUser.Id, CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetUserPreference(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _userPreferenceProvider.UserPreferenceUpdateGet(CurrentUser.Id, Id);

                switch (x.PreferenceTypeId)
                {
                    case 1:
                        x.Languages = await _LanguageProvider.LanguagesActiveList(CurrentUser.Id);
                        break;
                    case 2:
                        x.Pages = await _pageProvider.PageListForMenuTemplate(CurrentUser.Id);
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
        public async Task<IActionResult> Post(UserPreferenceUpdateGet UserPreference)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserPreference.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userPreferenceProvider.UserPreferenceUpdatePostCheck(UserPreference);
                if (CheckString.Length == 0)
                {
                    _userPreferenceProvider.UserPreferenceUpdatePost(UserPreference);
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
        //[HttpPut("Update")]
        //public async Task<IActionResult> Put(UserPreferenceUpdateGet UserPreference)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
        //    {
        //        var CheckString = await _userPreferenceProvider.ClassificationCheckPut(Classification);
        //        if (CheckString.Length == 0)
        //        {
        //            _classificationProvider.PutClassification(Classification);
        //            return Ok(Classification);
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //PETER TODO put or post. When to use what.
    }


}