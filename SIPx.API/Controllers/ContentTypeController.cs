﻿using System;
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
    public class ContentTypeController : ControllerBase
    {
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IContentMasterProvider _contentMasterProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypeController(IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IContentMasterProvider contentMasterProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _contentMasterProvider = contentMasterProvider;
            _userManager = userManager;
        }


        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _contentMasterProvider.ContentTypeLanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _contentMasterProvider.ContentTypeLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _contentMasterProvider.ContentTypeIndexGet(CurrentUser.Id));
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
                var x = await _contentMasterProvider.ContentTypeUpdateGet(CurrentUser.Id, Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;
                var ContentTypeGroups = await _contentMasterProvider.ContentTypeGroupList(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                x.ContentTypeGroups = ContentTypeGroups;
                x.SecurityLevels = SecurityLevels;

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ContentTypeCreateGet = new ContentTypeCreateGet();
                var ContentTypeGroups = await _contentMasterProvider.ContentTypeGroupList(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ContentTypeCreateGet.ContentTypeGroups = ContentTypeGroups;
                ContentTypeCreateGet.SecurityLevels = SecurityLevels;
                return Ok(ContentTypeCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Create(ContentTypeCreatePost ContentType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ContentType.CreatorId= CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _contentMasterProvider.ContentTypeCreatePostCheck(ContentType);
                if (CheckString.Length == 0)
                {
                    _contentMasterProvider.ContentTypeCreatePost(ContentType);
                    return Ok(ContentType);
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
        //[HttpGet("Create/{Id:int}")]
        //public async Task<IActionResult> Create(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var ContentTypeGroupCreateGet = new ContentTypeGroupCreateGet();
        //        var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
        //        ContentTypeGroupCreateGet.LanguageId = UserLanguage.LanguageId;
        //        ContentTypeGroupCreateGet.LanguageName = UserLanguage.Name;
        //        return Ok(ContentTypeGroupCreateGet);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
        //[HttpPost("Create2")]
        //public async Task<IActionResult> Post(ContentTypeGroupCreatePost ContentTypeGroup)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    ContentTypeGroup.CreatorId = CurrentUser.Id;
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var CheckString = await _contentMasterProvider.ContentTypeGroupCreatePostCheck(ContentTypeGroup);
        //        if (CheckString.Length == 0)
        //        {
        //            _contentMasterProvider.ContentTypeGroupCreatePost(ContentTypeGroup);
        //            return Ok(ContentTypeGroup);
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
        //}

    }
}