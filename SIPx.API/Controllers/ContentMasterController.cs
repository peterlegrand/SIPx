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
    public class ContentMasterController : ControllerBase
    {
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IContentTypeClassificationStatusProvider _contentTypeClassificationStatusProvider;
        private readonly IContentTypeClassificationProvider _contentTypeClassificationProvider;
        private readonly IContentTypeGroupProvider _contentTypeGroupProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ContentMasterController(IContentTypeProvider contentTypeProvider, IContentTypeClassificationStatusProvider contentTypeClassificationStatusProvider, IContentTypeClassificationProvider contentTypeClassificationProvider, IContentTypeGroupProvider contentTypeGroupProvider, IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _contentTypeProvider = contentTypeProvider;
            _contentTypeClassificationStatusProvider = contentTypeClassificationStatusProvider;
            _contentTypeClassificationProvider = contentTypeClassificationProvider;
            _contentTypeGroupProvider = contentTypeGroupProvider;
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        //[HttpGet("Statuses")]
        //public async Task<IActionResult> GetStatuses()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentMasterProvider.ContentStatusIndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("Status/{Id:int}")]
        //public async Task<IActionResult> GetStatus(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentMasterProvider.ContentStatusUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeClassifications/{Id:int}")]
        //public async Task<IActionResult> ContentTypeClassificationsIndexGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeClassificationProvider.IndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("GetContentTypeClassification/{Id:int}")]
        //public async Task<IActionResult> ContentTypeClassificationUpdateGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeClassificationProvider.UpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeClassificationStatuses")]
        //public async Task<IActionResult> GetContentTypeClassificationStatuses()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeClassificationStatusProvider.IndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeClassificationStatus/{Id:int}")]
        //public async Task<IActionResult> GetContentTypeClassificationStatus(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeClassificationStatusProvider.UpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeGroupLanguages/{Id:int}")]
        //public async Task<IActionResult> ContentTypeGroupLanguageIndexGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeGroupProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeGroupLanguage/{Id:int}")]
        //public async Task<IActionResult> ContentTypeGroupLanguageUpdateGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeGroupProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeGroupIndex")]
        //public async Task<IActionResult> ContentTypeGroupIndexGet()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeGroupProvider.IndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeGroupUpdate/{Id:int}")]
        //public async Task<IActionResult> ContentTypeGroupUpdateGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeGroupProvider.UpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeLanguages/{Id:int}")]
        //public async Task<IActionResult> GetValueRoles(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeLanguage/{Id:int}")]
        //public async Task<IActionResult> GetValueUsers(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypes")]
        //public async Task<IActionResult> GetContentTypes()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentTypeProvider.IndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentType/{Id:int}")]
        //public async Task<IActionResult> GetContentType(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        var x = await _contentTypeProvider.UpdateGet(CurrentUser.Id, Id);
        //        var icons = await _masterListProvider.IconList(CurrentUser.Id);
        //        x.Icons = icons;

        //        return Ok(x);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("Create")]
        //public async Task<IActionResult> Create()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var ContentTypeCreateGet = new ContentTypeCreateGet();
        //        var ContentTypeGroups = await _contentTypeGroupProvider.List(CurrentUser.Id);
        //        var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
        //        var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
        //        ContentTypeCreateGet.LanguageId = UserLanguage.LanguageId;
        //        ContentTypeCreateGet.LanguageName = UserLanguage.Name;
        //        ContentTypeCreateGet.ContentTypeGroups = ContentTypeGroups;
        //        ContentTypeCreateGet.SecurityLevels = SecurityLevels;
        //        return Ok(ContentTypeCreateGet);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpPost("Create")]
        //public async Task<IActionResult> Post(ContentTypeCreatePost ContentType)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    ContentType.CreatorId= CurrentUser.Id;
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var CheckString = await _contentTypeProvider.CreatePostCheck(ContentType);
        //        if (CheckString.Length == 0)
        //        {
        //            _contentTypeProvider.CreatePost(ContentType);
        //            return Ok(ContentType);
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
        //        var CheckString = await _contentTypeGroupProvider.CreatePostCheck(ContentTypeGroup);
        //        if (CheckString.Length == 0)
        //        {
        //            _contentTypeGroupProvider.CreatePost(ContentTypeGroup);
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