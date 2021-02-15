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
    public class ContentTypePropertyController : ControllerBase
    {
        private readonly IObjectTypePropertyStatus _objectTypePropertyStatus;
        private readonly ICheckProvider _checkProvider;
        private readonly IContentTypePropertyProvider _contentTypePropertyProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPropertyProvider _propertyProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypePropertyController(
            IObjectTypePropertyStatus objectTypePropertyStatus
            , ICheckProvider checkProvider
            , IContentTypePropertyProvider ContentTypePropertyProvider
            , IClaimCheck claimCheck
            , IPropertyProvider propertyProvider 
            , IContentTypeProvider contentTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _objectTypePropertyStatus = objectTypePropertyStatus;
            _checkProvider = checkProvider;
            _contentTypePropertyProvider = ContentTypePropertyProvider;
            _claimCheck = claimCheck;
            _propertyProvider = propertyProvider;
            _contentTypeProvider = contentTypeProvider;
            _userManager = userManager;
        }
        private async Task<ObjectTypePropertyCreateGet> CreateAddDropDownBoxes(ObjectTypePropertyCreateGet ContentTypeProperty, string UserId)
        {
            ContentTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            ContentTypeProperty.Properties = await _propertyProvider.List(UserId);
            ContentTypeProperty.ObjectTypeName = await _contentTypeProvider.ReturnName(UserId, ContentTypeProperty.ObjectTypeId);
            return ContentTypeProperty;
        }

        private async Task<ObjectTypePropertyUpdateGet> UpdateAddDropDownBoxes(ObjectTypePropertyUpdateGet ContentTypeProperty, string UserId)
        {
            ContentTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            ContentTypeProperty.Properties = await _propertyProvider.List(UserId);
            ContentTypeProperty.ObjectTypeName = await _contentTypeProvider.ReturnName(UserId, ContentTypeProperty.ObjectTypeId);
            return ContentTypeProperty;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ContentTypeProperty = new ObjectTypePropertyCreateGet();
                ContentTypeProperty.ObjectTypeId = Id;
                ContentTypeProperty = await CreateAddDropDownBoxes(ContentTypeProperty, CurrentUser.Id);
                return Ok(ContentTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ObjectTypePropertyCreateGet ContentTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ContentTypeProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypePropertyProvider.CreatePostCheck(ContentTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    ContentTypeProperty = await CreateAddDropDownBoxes(ContentTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _contentTypePropertyProvider.CreatePost(ContentTypeProperty);
                }
                ObjectTypePropertyCreateGetWithErrorMessages ContentTypePropertyWithErrorMessage = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty = ContentTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(ContentTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyCreateGetWithErrorMessages ContentTypePropertyWithNoRights = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty= ContentTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(ContentTypePropertyWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ObjectTypeProperty = new ObjectTypePropertyIndexGet();
                ObjectTypeProperty.ObjectTypeId = Id;
                ObjectTypeProperty.ObjectTypeName = await _contentTypeProvider.ReturnName(CurrentUser.Id, Id);
                ObjectTypeProperty.ObjectTypePropertyIndexGetGrid = await _contentTypePropertyProvider.IndexGet(CurrentUser.Id, Id);
                return Ok(ObjectTypeProperty);
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
                var ContentTypeProperty = await _contentTypePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                ContentTypeProperty = await UpdateAddDropDownBoxes(ContentTypeProperty, CurrentUser.Id);
                return Ok(ContentTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ObjectTypePropertyUpdateGet ContentTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _contentTypePropertyProvider.UpdatePostCheck(ContentTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    ContentTypeProperty = await UpdateAddDropDownBoxes(ContentTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _contentTypePropertyProvider.UpdatePost(ContentTypeProperty);
                }
                ObjectTypePropertyUpdateGetWithErrorMessages ContentTypePropertyWithErrorMessage = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = ContentTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(ContentTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyUpdateGetWithErrorMessages ContentTypePropertyWithNoRights = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = ContentTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(ContentTypePropertyWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ContentTypePropertys", "ContentTypePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _contentTypePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ObjectTypePropertyDeleteGet ContentTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ContentTypeProperty.UserId= CurrentUser.Id;
                //var CheckString = await _ContentTypePropertyProvider.DeletePostCheck(ContentTypeProperty);
                //if (CheckString.Length == 0)
                //{
                _contentTypePropertyProvider.DeletePost(CurrentUser.Id, ContentTypeProperty.ObjectTypePropertyId);
                return Ok(ContentTypeProperty);
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

    }
}