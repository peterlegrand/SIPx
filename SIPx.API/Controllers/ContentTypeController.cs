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
    public class ContentTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IContentMasterProvider _contentMasterProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypeController(ICheckProvider checkProvider, IContentTypeProvider contentTypeProvider, IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IContentMasterProvider contentMasterProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _contentTypeProvider = contentTypeProvider;
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _contentMasterProvider = contentMasterProvider;
            _userManager = userManager;
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ContentTypeUpdateGet ContentType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ContentType.CreatorId = CurrentUser.Id;
                //var CheckString = await _ContentTypeProvider.UpdatePostCheck(ContentType);
                //if (CheckString.Length == 0)
                //{
                _contentTypeProvider.UpdatePost(ContentType);
                return Ok(ContentType);
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
                if (await _checkProvider.CheckIfRecordExists("ContentTypes", "ContentTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _contentTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ContentTypeDeleteGet ContentType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ContentType.CreatorId = CurrentUser.Id;
                //var CheckString = await _ContentTypeProvider.DeletePostCheck(ContentType);
                //if (CheckString.Length == 0)
                //{
                _contentTypeProvider.DeletePost(ContentType.ContentTypeId);
                return Ok(ContentType);
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

    }
}