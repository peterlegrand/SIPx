using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class PropertyValueController : ControllerBase
    {
        private readonly IPropertyValueProvider _propertyValueProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PropertyValueController(IPropertyValueProvider propertyValueProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _propertyValueProvider = propertyValueProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        private async Task<PropertyValueCreateGet> CreateAddDropDownBoxes(PropertyValueCreateGet PropertyValue, string UserId, int PropertyId)
        {
            var PropertyValueCreateGetSequences = await _propertyValueProvider.CreateGetSequence(UserId, PropertyId);
            PropertyValueCreateGetSequences.Add(new SequenceList { Sequence = PropertyValueCreateGetSequences.Count + 1, Name = "Add at the end" });
            PropertyValue.PropertyValues = PropertyValueCreateGetSequences;
            PropertyValue.PropertyId = PropertyId;
            PropertyValue.PropertyTypeId = await _propertyValueProvider.CreateGetType(UserId, PropertyId);

            return PropertyValue;
        }

        private async Task<PropertyValueUpdateGet> UpdateAddDropDownBoxes(PropertyValueUpdateGet PropertyValue, string UserId)
        {
            PropertyValue.PropertyValues = await _propertyValueProvider.CreateGetSequence(UserId, PropertyValue.PropertyId);

            return PropertyValue;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PropertyValue = new PropertyValueCreateGet();
                PropertyValue = await CreateAddDropDownBoxes(PropertyValue, CurrentUser.Id, Id);
                return Ok(PropertyValue);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PropertyValueCreateGet PropertyValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PropertyValue.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _propertyValueProvider.CreatePostCheck(PropertyValue);
                if (ErrorMessages.Count > 0)
                {
                    PropertyValue = await CreateAddDropDownBoxes(PropertyValue, CurrentUser.Id, PropertyValue.PropertyId);
                }
                else
                {
                    _propertyValueProvider.CreatePost(PropertyValue);
                }
                PropertyValueCreateGetWithErrorMessages PropertyValueWithErrorMessage = new PropertyValueCreateGetWithErrorMessages { PropertyValue = PropertyValue, ErrorMessages = ErrorMessages };
                return Ok(PropertyValueWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PropertyValueCreateGetWithErrorMessages PropertyValueWithNoRights = new PropertyValueCreateGetWithErrorMessages { PropertyValue = PropertyValue, ErrorMessages = ErrorMessages };
            return Ok(PropertyValueWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("PropertyValues", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var PropertyValue = await _propertyValueProvider.IndexGet(CurrentUser.Id, Id);

                return Ok(PropertyValue);
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
                if (await _checkProvider.CheckIfRecordExists("PropertyValues", "PropertyValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var PropertyValue = await _propertyValueProvider.UpdateGet(CurrentUser.Id, Id);
                PropertyValue = await UpdateAddDropDownBoxes(PropertyValue, CurrentUser.Id);
                return Ok(PropertyValue);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(PropertyValueUpdateGet PropertyValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PropertyValue.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _propertyValueProvider.UpdatePostCheck(PropertyValue);
                if (ErrorMessages.Count > 0)
                {
                    PropertyValue = await UpdateAddDropDownBoxes(PropertyValue, CurrentUser.Id);
                }
                else
                {
                    _propertyValueProvider.UpdatePost(PropertyValue);
                }
                PropertyValueUpdateGetWithErrorMessages PropertyValueWithErrorMessage = new PropertyValueUpdateGetWithErrorMessages { PropertyValue = PropertyValue, ErrorMessages = ErrorMessages };
                return Ok(PropertyValueWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PropertyValueUpdateGetWithErrorMessages PropertyValueWithNoRights = new PropertyValueUpdateGetWithErrorMessages { PropertyValue = PropertyValue, ErrorMessages = ErrorMessages };
            return Ok(PropertyValueWithNoRights);
        }


        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PropertyValues", "PropertyValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _propertyValueProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PropertyValueDeleteGet PropertyValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _PropertyValueProvider.DeletePostCheck(PropertyValue);
                //if (CheckString.Length == 0)
                //{
                _propertyValueProvider.DeletePost(PropertyValue.PropertyValueId);
                return Ok(PropertyValue);
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
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        if (await _checkProvider.CheckIfRecordExists("PropertyValueLanguages", "PropertyValueID", Id) == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No record with this ID",
        //            });
        //        }


        //        return Ok(await _PropertyValueProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        if (await _checkProvider.CheckIfRecordExists("PropertyValueLanguages", "PropertyValueLanguageID", Id) == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No record with this ID",
        //            });
        //        }

        //        return Ok(await _PropertyValueProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
    }
}