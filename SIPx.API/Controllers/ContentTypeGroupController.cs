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
    public class ContentTypeGroupController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IContentTypeGroupProvider _contentTypeGroupProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypeGroupController(ICheckProvider checkProvider, IContentTypeGroupProvider contentTypeGroupProvider, IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _contentTypeGroupProvider = contentTypeGroupProvider;
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ContentTypeGroupCreateGet = new ContentTypeGroupCreateGet();
                var ContentTypeGroupCreateGetSequences = await _contentTypeGroupProvider.CreateGetSequence(CurrentUser.Id);
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ContentTypeGroupCreateGet.LanguageId = UserLanguage.LanguageId;
                ContentTypeGroupCreateGet.LanguageName = UserLanguage.Name;
                ContentTypeGroupCreateGet.Sequences = ContentTypeGroupCreateGetSequences;
                ContentTypeGroupCreateGet.Sequences.Add(new SequenceList { Sequence = ContentTypeGroupCreateGetSequences.Count, Name = "Add at the end" });
                return Ok(ContentTypeGroupCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ContentTypeGroupCreatePost ContentTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ContentTypeGroup.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _ContentTypeGroupProvider.ContentTypeGroupCreatePostCheck(ContentTypeGroup);
                //if (CheckString.Length == 0)
                //{
                _contentTypeGroupProvider.CreatePost(ContentTypeGroup);
                return Ok(ContentTypeGroup);
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

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _contentTypeGroupProvider.IndexGet(CurrentUser.Id));
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
                var ContentGroupType = await _contentTypeGroupProvider.UpdateGet(CurrentUser.Id, Id);
                ContentGroupType.Sequences = await _contentTypeGroupProvider.CreateGetSequence(CurrentUser.Id);
                return Ok(ContentGroupType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ContentTypeGroupUpdateGet ContentTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ContentTypeGroup.CreatorId = CurrentUser.Id;
                //var CheckString = await _ContentTypeGroupProvider.UpdatePostCheck(ContentTypeGroup);
                //if (CheckString.Length == 0)
                //{
                _contentTypeGroupProvider.UpdatePost(ContentTypeGroup);
                return Ok(ContentTypeGroup);
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
                var x = await _contentTypeGroupProvider.DeleteGet(CurrentUser.Id, Id);
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
                _contentTypeGroupProvider.DeletePost(ContentType.ContentTypeId);
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

    }
}