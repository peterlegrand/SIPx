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
    public class FrontPersonAddressController : ControllerBase
    {
        private readonly IAddressTypeProvider _addressTypeProvider;
        private readonly IPersonAddressProvider _personAddressProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        //private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontPersonAddressController( IAddressTypeProvider addressTypeProvider, IPersonAddressProvider personAddressProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _addressTypeProvider = addressTypeProvider;
            _personAddressProvider = personAddressProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            //_peopleProvider = peopleProvider;
            _userManager = userManager;
        }
        private async Task<PersonAddressCreateGet> CreateAddDropDownBoxes(PersonAddressCreateGet PersonAddress, string UserId, int PersonId)
        {
            var AddressTypes = await _addressTypeProvider.List(UserId);
            var Countries = await _masterListProvider.CountryList(UserId);
            PersonAddress.AddressTypes = AddressTypes;
            PersonAddress.Countries = Countries;
            PersonAddress.PersonId = PersonId;
            return PersonAddress;
        }
        private async Task<PersonAddressUpdateGet> UpdateAddDropDownBoxes(PersonAddressUpdateGet PersonAddress, string UserId)
        {
            var Countries = await _masterListProvider.CountryList(UserId);
            var AddressTypes = await _addressTypeProvider.List(UserId);
            PersonAddress.Countries = Countries;
            PersonAddress.AddressTypes = AddressTypes;

            return PersonAddress;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonAddress = new PersonAddressCreateGet();
                PersonAddress = await CreateAddDropDownBoxes(PersonAddress, CurrentUser.Id, Id);
                return Ok(PersonAddress);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonAddressCreateGet PersonAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonAddress.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personAddressProvider.CreatePostCheck(PersonAddress);
                if (ErrorMessages.Count > 0)
                {
                    PersonAddress = await CreateAddDropDownBoxes(PersonAddress, CurrentUser.Id, PersonAddress.PersonId);
                }
                else
                {
                    _personAddressProvider.CreatePost(PersonAddress);
                }
                PersonAddressCreateGetWithErrorMessages PersonAddressWithErrorMessage = new PersonAddressCreateGetWithErrorMessages { PersonAddress = PersonAddress, ErrorMessages = ErrorMessages };
                return Ok(PersonAddressWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonAddressCreateGetWithErrorMessages PersonAddressWithNoRights = new PersonAddressCreateGetWithErrorMessages { PersonAddress = PersonAddress, ErrorMessages = ErrorMessages };
            return Ok(PersonAddressWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _personAddressProvider.IndexGet(CurrentUser.Id, Id));
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
                var PersonAddress = await _personAddressProvider.UpdateGet(CurrentUser.Id, Id);
                PersonAddress = await UpdateAddDropDownBoxes(PersonAddress, CurrentUser.Id);
                return Ok(PersonAddress);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonAddressUpdateGet PersonAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonAddress.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personAddressProvider.UpdatePostCheck(PersonAddress);
                if (ErrorMessages.Count > 0)
                {
                    PersonAddress = await UpdateAddDropDownBoxes(PersonAddress, CurrentUser.Id);
                }
                else
                {
                    _personAddressProvider.UpdatePost(PersonAddress);
                }
                PersonAddressUpdateGetWithErrorMessages PersonAddressWithErrorMessage = new PersonAddressUpdateGetWithErrorMessages { PersonAddress = PersonAddress, ErrorMessages = ErrorMessages };
                return Ok(PersonAddressWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonAddressUpdateGetWithErrorMessages PersonAddressWithNoRights = new PersonAddressUpdateGetWithErrorMessages { PersonAddress = PersonAddress, ErrorMessages = ErrorMessages };
            return Ok(PersonAddressWithNoRights);

        }

        [HttpGet("View/{Id:int}")]
        public async Task<IActionResult> View(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("PersonAddresss", "PersonAddressID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var PersonAddress = await _personAddressProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(PersonAddress);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("PersonAddresss", "PersonAddressID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _personAddressProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonAddressDeleteGet PersonAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonAddress.UserId= CurrentUser.Id;
                //var CheckString = await _PersonAddressProvider.DeletePostCheck(PersonAddress);
                //if (CheckString.Length == 0)
                //{
                _personAddressProvider.DeletePost(CurrentUser.Id, PersonAddress.PersonAddressId);
                return Ok(PersonAddress);
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