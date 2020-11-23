using System;
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

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PropertyValueCreateGet = new PropertyValueCreateGet();
                var PropertyValueCreateGetSequences = await _propertyValueProvider.CreateGetSequence(CurrentUser.Id, Id);
                PropertyValueCreateGetSequences.Add(new SequenceList { Sequence = PropertyValueCreateGetSequences.Count + 1, Name = "Add at the end" });
                PropertyValueCreateGet.PropertyValues = PropertyValueCreateGetSequences;
                PropertyValueCreateGet.PropertyId = Id;
                PropertyValueCreateGet.PropertyTypeId = await _propertyValueProvider.CreateGetType(CurrentUser.Id, Id);
                return Ok(PropertyValueCreateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _PropertyValueProvider.CreatePostCheck(PropertyValue);
                //if (CheckString.Length == 0)
                //{

                var PropertyTypeId = await _propertyValueProvider.CreateGetType(CurrentUser.Id, PropertyValue.PropertyId);
                if(PropertyTypeId != 6)
                { PropertyValue.PropertyValueDate = DateTime.Now; }
                _propertyValueProvider.CreatePost(PropertyValue);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PropertyValueUpdateGet PropertyValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PropertyValue.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _PropertyValueProvider.UpdatePostCheck(PropertyValue);
                //if (CheckString.Length == 0)
                //{
                    _propertyValueProvider.UpdatePost(PropertyValue);
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

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
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
                PropertyValue.PropertyValues = await _propertyValueProvider.CreateGetSequence(CurrentUser.Id, PropertyValue.PropertyId);
                return Ok(PropertyValue);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
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
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
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