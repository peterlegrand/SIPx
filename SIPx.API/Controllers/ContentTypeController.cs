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
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IContentTypeClassificationProvider _contentTypeClassificationProvider;
        private readonly IContentTypeClassificationStatusProvider _contentTypeClassificationStatusProvider;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly IContentTypeGroupProvider _contentTypeGroupProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypeController(IClassificationValueProvider classificationValueProvider, IContentTypeClassificationProvider contentTypeClassificationProvider, IContentTypeClassificationStatusProvider contentTypeClassificationStatusProvider, IProcessTypeProvider processTypeProvider, IContentTypeGroupProvider contentTypeGroupProvider, ICheckProvider checkProvider, IContentTypeProvider contentTypeProvider, IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationValueProvider = classificationValueProvider;
            _contentTypeClassificationProvider = contentTypeClassificationProvider;
            _contentTypeClassificationStatusProvider = contentTypeClassificationStatusProvider;
            _processTypeProvider = processTypeProvider;
            _contentTypeGroupProvider = contentTypeGroupProvider;
            _checkProvider = checkProvider;
            _contentTypeProvider = contentTypeProvider;
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        private async Task<ContentTypeCreateGet> CreateAddDropDownBoxes(ContentTypeCreateGet ContentType, string UserId)
        {
            var ContentTypeGroups = await _contentTypeGroupProvider.List(UserId);
            var ProcessTypes = await _contentTypeProvider.CreateGetProcessTypes(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var Icons = await _masterListProvider.IconList(UserId);
            var ContentTypeClassificationStatuses = await _contentTypeClassificationStatusProvider.List(UserId);
            var ContentTypeClassifications = await _contentTypeClassificationProvider.CreateGetClassifications(UserId);

            ContentType.ContentTypeGroups = ContentTypeGroups;
            ContentType.Icons = Icons;
            ContentType.SecurityLevels = SecurityLevels;
            ContentType.ProcessTypes = ProcessTypes;
            ContentType.ContentTypeClassificationStatuses = ContentTypeClassificationStatuses;
            ContentType.ContentTypeClassifications = ContentTypeClassifications;
            return ContentType;
        }
        private async Task<ContentTypeUpdateGet> UpdateAddDropDownBoxes(ContentTypeUpdateGet ContentType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            var ContentTypeGroups = await _contentTypeGroupProvider.List(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            var ProcessTypes = await _processTypeProvider.List(UserId);

            var ContentTypeClassifications = await _contentTypeClassificationProvider.UpdateGetClassifications(UserId, ContentType.ContentTypeId);


            var ContentTypeClassificationStatuses = await _contentTypeClassificationStatusProvider.List(UserId);
            ContentType.ContentTypeClassificationStatuses = ContentTypeClassificationStatuses;
            ContentType.ContentTypeGroups = ContentTypeGroups;
            ContentType.ContentTypeClassifications = ContentTypeClassifications;

            ContentType.SecurityLevels = SecurityLevels;
            ContentType.ProcessTypes = ProcessTypes;
            ContentType.Icons = icons;

            return ContentType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ContentType = new ContentTypeCreateGet();
                ContentType = await CreateAddDropDownBoxes(ContentType, CurrentUser.Id);
                return Ok(ContentType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Create(ContentTypeCreateGet ContentType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ContentType.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypeProvider.CreatePostCheck(ContentType);
                if (ErrorMessages.Count > 0)
                {
                    ContentType = await CreateAddDropDownBoxes(ContentType, CurrentUser.Id);
                }
                else
                {
                    _contentTypeProvider.CreatePost(ContentType);
                }
                ContentTypeCreateGetWithErrorMessages ContentTypeWithErrorMessage = new ContentTypeCreateGetWithErrorMessages { ContentType = ContentType, ErrorMessages = ErrorMessages };
                return Ok(ContentTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ContentTypeCreateGetWithErrorMessages ContentTypeWithNoRights = new ContentTypeCreateGetWithErrorMessages { ContentType = ContentType, ErrorMessages = ErrorMessages };
            return Ok(ContentTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _contentTypeProvider.IndexGet(CurrentUser.Id));
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
                var ContentType = await _contentTypeProvider.UpdateGet(CurrentUser.Id, Id);
                ContentType =await UpdateAddDropDownBoxes(ContentType, CurrentUser.Id);
                return Ok(ContentType);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypeProvider.UpdatePostCheck(ContentType);
                if (ErrorMessages.Count > 0)
                {
                    ContentType = await UpdateAddDropDownBoxes(ContentType, CurrentUser.Id);
                }
                else
                {
                    ContentType.UserId = CurrentUser.Id;
                    _contentTypeProvider.UpdatePost(ContentType);
                }
                ContentTypeUpdateGetWithErrorMessages ContentTypeWithErrorMessage = new ContentTypeUpdateGetWithErrorMessages { ContentType = ContentType, ErrorMessages = ErrorMessages };
                return Ok(ContentTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ContentTypeUpdateGetWithErrorMessages ContentTypeWithNoRights = new ContentTypeUpdateGetWithErrorMessages { ContentType = ContentType, ErrorMessages = ErrorMessages };
            return Ok(ContentTypeWithNoRights);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ContentType.UserId= CurrentUser.Id;
                //var CheckString = await _ContentTypeProvider.DeletePostCheck(ContentType);
                //if (CheckString.Length == 0)
                //{
                _contentTypeProvider.DeletePost(CurrentUser.Id, ContentType.ContentTypeId);
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

        //[HttpGet("LanguageIndex/{Id:int}")]
        //public async Task<IActionResult> LanguageIndex(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _contentTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _contentTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

    }
}