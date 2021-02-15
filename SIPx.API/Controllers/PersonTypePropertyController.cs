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
    public class PersonTypePropertyController : ControllerBase
    {
        private readonly IObjectTypePropertyStatus _objectTypePropertyStatus;
        private readonly ICheckProvider _checkProvider;
        private readonly IPersonTypePropertyProvider _personTypePropertyProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPropertyProvider _propertyProvider;
        private readonly IPersonTypeProvider _personTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonTypePropertyController(
            IObjectTypePropertyStatus objectTypePropertyStatus
            , ICheckProvider checkProvider
            , IPersonTypePropertyProvider PersonTypePropertyProvider
            , IClaimCheck claimCheck
            , IPropertyProvider propertyProvider 
            , IPersonTypeProvider personTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _objectTypePropertyStatus = objectTypePropertyStatus;
            _checkProvider = checkProvider;
            _personTypePropertyProvider = PersonTypePropertyProvider;
            _claimCheck = claimCheck;
            _propertyProvider = propertyProvider;
            _personTypeProvider = personTypeProvider;
            _userManager = userManager;
        }
        private async Task<ObjectTypePropertyCreateGet> CreateAddDropDownBoxes(ObjectTypePropertyCreateGet PersonTypeProperty, string UserId)
        {
            PersonTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            PersonTypeProperty.Properties = await _propertyProvider.List(UserId);
            PersonTypeProperty.ObjectTypeName = await _personTypeProvider.ReturnName(UserId, PersonTypeProperty.ObjectTypeId);
            return PersonTypeProperty;
        }

        private async Task<ObjectTypePropertyUpdateGet> UpdateAddDropDownBoxes(ObjectTypePropertyUpdateGet PersonTypeProperty, string UserId)
        {
            PersonTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            PersonTypeProperty.Properties = await _propertyProvider.List(UserId);
            PersonTypeProperty.ObjectTypeName = await _personTypeProvider.ReturnName(UserId, PersonTypeProperty.ObjectTypeId);
            return PersonTypeProperty;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonTypeProperty = new ObjectTypePropertyCreateGet();
                PersonTypeProperty.ObjectTypeId = Id;
                PersonTypeProperty = await CreateAddDropDownBoxes(PersonTypeProperty, CurrentUser.Id);
                return Ok(PersonTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ObjectTypePropertyCreateGet PersonTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonTypeProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personTypePropertyProvider.CreatePostCheck(PersonTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    PersonTypeProperty = await CreateAddDropDownBoxes(PersonTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _personTypePropertyProvider.CreatePost(PersonTypeProperty);
                }
                ObjectTypePropertyCreateGetWithErrorMessages PersonTypePropertyWithErrorMessage = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty = PersonTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(PersonTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyCreateGetWithErrorMessages PersonTypePropertyWithNoRights = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty= PersonTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(PersonTypePropertyWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ObjectTypeProperty = new ObjectTypePropertyIndexGet();
                ObjectTypeProperty.ObjectTypeId = Id;
                ObjectTypeProperty.ObjectTypeName = await _personTypeProvider.ReturnName(CurrentUser.Id, Id);
                ObjectTypeProperty.ObjectTypePropertyIndexGetGrid = await _personTypePropertyProvider.IndexGet(CurrentUser.Id, Id);
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
                var PersonTypeProperty = await _personTypePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                PersonTypeProperty = await UpdateAddDropDownBoxes(PersonTypeProperty, CurrentUser.Id);
                return Ok(PersonTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ObjectTypePropertyUpdateGet PersonTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personTypePropertyProvider.UpdatePostCheck(PersonTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    PersonTypeProperty = await UpdateAddDropDownBoxes(PersonTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _personTypePropertyProvider.UpdatePost(PersonTypeProperty);
                }
                ObjectTypePropertyUpdateGetWithErrorMessages PersonTypePropertyWithErrorMessage = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = PersonTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(PersonTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyUpdateGetWithErrorMessages PersonTypePropertyWithNoRights = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = PersonTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(PersonTypePropertyWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PersonTypePropertys", "PersonTypePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _personTypePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ObjectTypePropertyDeleteGet PersonTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonTypeProperty.UserId= CurrentUser.Id;
                //var CheckString = await _PersonTypePropertyProvider.DeletePostCheck(PersonTypeProperty);
                //if (CheckString.Length == 0)
                //{
                _personTypePropertyProvider.DeletePost(CurrentUser.Id, PersonTypeProperty.ObjectTypePropertyId);
                return Ok(PersonTypeProperty);
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