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
        private async Task<ContentTypeGroupCreateGet> CreateAddDropDownBoxes(ContentTypeGroupCreateGet ContentTypeGroup, string UserId)
        {
            var ContentTypeGroupCreateGetSequences = await _contentTypeGroupProvider.CreateGetSequence(UserId);
            var Statuses = await _masterListProvider.StatusList(UserId);
            var icons = await _masterListProvider.IconList(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ContentTypeGroup.LanguageId = UserLanguage.LanguageId;
            ContentTypeGroup.LanguageName = UserLanguage.Name;
            ContentTypeGroup.Sequences = ContentTypeGroupCreateGetSequences;
            ContentTypeGroup.Sequences.Add(new SequenceList { Sequence = ContentTypeGroupCreateGetSequences.Count + 1, Name = "Add at the end" });
            return ContentTypeGroup;
        }
        private async Task<ContentTypeGroupUpdateGet> UpdateAddDropDownBoxes(ContentTypeGroupUpdateGet ContentTypeGroup, string UserId)
        {
            ContentTypeGroup.Sequences = await _contentTypeGroupProvider.CreateGetSequence(UserId);

            return ContentTypeGroup;
        }
 
            [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ContentTypeGroup = new ContentTypeGroupCreateGet();
                ContentTypeGroup = await CreateAddDropDownBoxes(ContentTypeGroup, CurrentUser.Id);
                return Ok(ContentTypeGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ContentTypeGroupCreateGet ContentTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ContentTypeGroup.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypeGroupProvider.CreatePostCheck(ContentTypeGroup);
                if (ErrorMessages.Count > 0)
                {
                    ContentTypeGroup = await CreateAddDropDownBoxes(ContentTypeGroup, CurrentUser.Id);
                }
                else
                {
                    _contentTypeGroupProvider.CreatePost(ContentTypeGroup);
                }
                ContentTypeGroupCreateGetWithErrorMessages ContentTypeGroupWithErrorMessage = new ContentTypeGroupCreateGetWithErrorMessages { ContentTypeGroup = ContentTypeGroup, ErrorMessages = ErrorMessages };
                return Ok(ContentTypeGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ContentTypeGroupCreateGetWithErrorMessages ContentTypeGroupWithNoRights = new ContentTypeGroupCreateGetWithErrorMessages { ContentTypeGroup = ContentTypeGroup, ErrorMessages = ErrorMessages };
            return Ok(ContentTypeGroupWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ContentTypeGroup = await _contentTypeGroupProvider.UpdateGet(CurrentUser.Id, Id);
                ContentTypeGroup = await UpdateAddDropDownBoxes(ContentTypeGroup, CurrentUser.Id);
                return Ok(ContentTypeGroup);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypeGroupProvider.UpdatePostCheck(ContentTypeGroup);
                if (ErrorMessages.Count > 0)
                {
                    ContentTypeGroup = await UpdateAddDropDownBoxes(ContentTypeGroup, CurrentUser.Id);
                }
                else
                {
                    _contentTypeGroupProvider.UpdatePost(ContentTypeGroup);
                }
                ContentTypeGroupUpdateGetWithErrorMessages ContentTypeGroupWithErrorMessage = new ContentTypeGroupUpdateGetWithErrorMessages {  ContentTypeGroup = ContentTypeGroup, ErrorMessages = ErrorMessages };
                return Ok(ContentTypeGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ContentTypeGroupUpdateGetWithErrorMessages ContentTypeGroupWithNoRights = new ContentTypeGroupUpdateGetWithErrorMessages { ContentTypeGroup = ContentTypeGroup, ErrorMessages = ErrorMessages };
            return Ok(ContentTypeGroupWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
        public async Task<IActionResult> Delete(ContentTypeGroupDeleteGet ContentTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
//                ContentType.CreatorId = CurrentUser.Id;
                //var CheckString = await _ContentTypeProvider.DeletePostCheck(ContentType);
                //if (CheckString.Length == 0)
                //{
                _contentTypeGroupProvider.DeletePost(ContentTypeGroup.ContentTypeGroupId);
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

        //[HttpGet("ContentTypeGroupLanguages/{Id:int}")]
        //public async Task<IActionResult> ContentTypeGroupLanguageIndexGet(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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