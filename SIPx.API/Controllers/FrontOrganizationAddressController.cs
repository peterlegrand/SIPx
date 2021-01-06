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
    public class FrontOrganizationAddressController : ControllerBase
    {
        private readonly IAddressTypeProvider _addressTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationAddressProvider _organizationAddressProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontOrganizationAddressController(IAddressTypeProvider addressTypeProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationAddressProvider organizationAddressProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _addressTypeProvider = addressTypeProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _organizationAddressProvider = organizationAddressProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<OrganizationAddressCreateGet> CreateAddDropDownBoxes(OrganizationAddressCreateGet OrganizationAddress, string UserId, int OrganizationId)
        {
            var AddressTypes = await _addressTypeProvider.List(UserId);
            var Countries = await _masterListProvider.CountryList(UserId);
            OrganizationAddress.AddressTypes = AddressTypes;
            OrganizationAddress.Countries = Countries;
            OrganizationAddress.OrganizationId = OrganizationId;
            return OrganizationAddress;
        }
        private async Task<OrganizationAddressUpdateGet> UpdateAddDropDownBoxes(OrganizationAddressUpdateGet OrganizationAddress, string UserId)
        {

            OrganizationAddress.AddressTypes = await _addressTypeProvider.List(UserId);
            OrganizationAddress.Countries = await _masterListProvider.CountryList(UserId);
            return OrganizationAddress;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationAddress = new OrganizationAddressCreateGet();
                OrganizationAddress = await CreateAddDropDownBoxes(OrganizationAddress, CurrentUser.Id, Id);
                return Ok(OrganizationAddress);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationAddressCreateGet OrganizationAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationAddress.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationAddressProvider.CreatePostCheck(OrganizationAddress);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationAddress = await CreateAddDropDownBoxes(OrganizationAddress, CurrentUser.Id, OrganizationAddress.OrganizationId);
                }
                else
                {
                    _organizationAddressProvider.CreatePost(OrganizationAddress);
                }
                OrganizationAddressCreateGetWithErrorMessages OrganizationAddressWithErrorMessage = new OrganizationAddressCreateGetWithErrorMessages { OrganizationAddress = OrganizationAddress, ErrorMessages = ErrorMessages };
                return Ok(OrganizationAddressWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationAddressCreateGetWithErrorMessages OrganizationAddressWithNoRights = new OrganizationAddressCreateGetWithErrorMessages { OrganizationAddress = OrganizationAddress, ErrorMessages = ErrorMessages };
            return Ok(OrganizationAddressWithNoRights);
        }
        //PETER TODO Have to check if the address update create delete is not of an user person/Organization internal


        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var OrganizationAddress = await _organizationAddressProvider.UpdateGet(CurrentUser.Id, Id);
                OrganizationAddress = await UpdateAddDropDownBoxes(OrganizationAddress, CurrentUser.Id);
                return Ok(OrganizationAddress);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(OrganizationAddressUpdateGet OrganizationAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationAddress.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationAddressProvider.UpdatePostCheck(OrganizationAddress);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationAddress = await UpdateAddDropDownBoxes(OrganizationAddress, CurrentUser.Id);
                }
                else
                {
                    _organizationAddressProvider.UpdatePost(OrganizationAddress);
                }
                OrganizationAddressUpdateGetWithErrorMessages OrganizationAddressWithErrorMessage = new OrganizationAddressUpdateGetWithErrorMessages { OrganizationAddress = OrganizationAddress, ErrorMessages = ErrorMessages };
                return Ok(OrganizationAddressWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationAddressUpdateGetWithErrorMessages OrganizationAddressWithNoRights = new OrganizationAddressUpdateGetWithErrorMessages { OrganizationAddress = OrganizationAddress, ErrorMessages = ErrorMessages };
            return Ok(OrganizationAddressWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("OrganizationAddresss", "OrganizationAddressID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _organizationAddressProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
            //PETER TODO for both telecom address person and organization need to check if it is a user (person) and if it is internal (organization) then cannot delete from front.
        }

        [HttpGet("View/{Id:int}")]
        public async Task<IActionResult> View(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var x = await _organizationAddressProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationAddressDeleteGet OrganizationAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                OrganizationAddress.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationAddressProvider.DeletePostCheck(OrganizationAddress);
                //if (CheckString.Length == 0)
                //{
                _organizationAddressProvider.DeletePost(CurrentUser.Id, OrganizationAddress.OrganizationAddressId);
                return Ok(OrganizationAddress);
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