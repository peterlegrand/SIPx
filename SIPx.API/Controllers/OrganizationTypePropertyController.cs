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
    public class OrganizationTypePropertyController : ControllerBase
    {
        private readonly IObjectTypePropertyStatus _objectTypePropertyStatus;
        private readonly ICheckProvider _checkProvider;
        private readonly IOrganizationTypePropertyProvider _organizationTypePropertyProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPropertyProvider _propertyProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationTypePropertyController(
            IObjectTypePropertyStatus objectTypePropertyStatus
            , ICheckProvider checkProvider
            , IOrganizationTypePropertyProvider OrganizationTypePropertyProvider
            , IClaimCheck claimCheck
            , IPropertyProvider propertyProvider 
            , IOrganizationTypeProvider organizationTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _objectTypePropertyStatus = objectTypePropertyStatus;
            _checkProvider = checkProvider;
            _organizationTypePropertyProvider = OrganizationTypePropertyProvider;
            _claimCheck = claimCheck;
            _propertyProvider = propertyProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _userManager = userManager;
        }
        private async Task<ObjectTypePropertyCreateGet> CreateAddDropDownBoxes(ObjectTypePropertyCreateGet OrganizationTypeProperty, string UserId)
        {
            OrganizationTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            OrganizationTypeProperty.Properties = await _propertyProvider.List(UserId);
            OrganizationTypeProperty.ObjectTypeName = await _organizationTypeProvider.ReturnName(UserId, OrganizationTypeProperty.ObjectTypeId);
            return OrganizationTypeProperty;
        }

        private async Task<ObjectTypePropertyUpdateGet> UpdateAddDropDownBoxes(ObjectTypePropertyUpdateGet OrganizationTypeProperty, string UserId)
        {
            OrganizationTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            OrganizationTypeProperty.Properties = await _propertyProvider.List(UserId);
            OrganizationTypeProperty.ObjectTypeName = await _organizationTypeProvider.ReturnName(UserId, OrganizationTypeProperty.ObjectTypeId);
            return OrganizationTypeProperty;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationTypeProperty = new ObjectTypePropertyCreateGet();
                OrganizationTypeProperty.ObjectTypeId = Id;
                OrganizationTypeProperty = await CreateAddDropDownBoxes(OrganizationTypeProperty, CurrentUser.Id);
                return Ok(OrganizationTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ObjectTypePropertyCreateGet OrganizationTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationTypeProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTypePropertyProvider.CreatePostCheck(OrganizationTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationTypeProperty = await CreateAddDropDownBoxes(OrganizationTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _organizationTypePropertyProvider.CreatePost(OrganizationTypeProperty);
                }
                ObjectTypePropertyCreateGetWithErrorMessages OrganizationTypePropertyWithErrorMessage = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty = OrganizationTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyCreateGetWithErrorMessages OrganizationTypePropertyWithNoRights = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty= OrganizationTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTypePropertyWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ObjectTypeProperty = new ObjectTypePropertyIndexGet();
                ObjectTypeProperty.ObjectTypeId = Id;
                ObjectTypeProperty.ObjectTypeName = await _organizationTypeProvider.ReturnName(CurrentUser.Id, Id);
                ObjectTypeProperty.ObjectTypePropertyIndexGetGrid = await _organizationTypePropertyProvider.IndexGet(CurrentUser.Id, Id);
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
                var OrganizationTypeProperty = await _organizationTypePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                OrganizationTypeProperty = await UpdateAddDropDownBoxes(OrganizationTypeProperty, CurrentUser.Id);
                return Ok(OrganizationTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ObjectTypePropertyUpdateGet OrganizationTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTypePropertyProvider.UpdatePostCheck(OrganizationTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationTypeProperty = await UpdateAddDropDownBoxes(OrganizationTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _organizationTypePropertyProvider.UpdatePost(OrganizationTypeProperty);
                }
                ObjectTypePropertyUpdateGetWithErrorMessages OrganizationTypePropertyWithErrorMessage = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = OrganizationTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyUpdateGetWithErrorMessages OrganizationTypePropertyWithNoRights = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = OrganizationTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTypePropertyWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("OrganizationTypePropertys", "OrganizationTypePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _organizationTypePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ObjectTypePropertyDeleteGet OrganizationTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                OrganizationTypeProperty.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationTypePropertyProvider.DeletePostCheck(OrganizationTypeProperty);
                //if (CheckString.Length == 0)
                //{
                _organizationTypePropertyProvider.DeletePost(CurrentUser.Id, OrganizationTypeProperty.ObjectTypePropertyId);
                return Ok(OrganizationTypeProperty);
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