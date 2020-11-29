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
    public class OrganizationAddressController : ControllerBase
    {
        private readonly IAddressTypeProvider _addressTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationAddressProvider _organizationAddressProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationAddressController(IAddressTypeProvider addressTypeProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationAddressProvider organizationAddressProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
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

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var OrganizationAddressCreateGet = new OrganizationAddressCreateGet();
                var AddressTypes = await _addressTypeProvider.List(CurrentUser.Id);
                var Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                OrganizationAddressCreateGet.AddressTypes = AddressTypes;
                OrganizationAddressCreateGet.Countries = Countries;
                OrganizationAddressCreateGet.OrganizationId = Id;
                return Ok(OrganizationAddressCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationAddressCreatePost OrganizationAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationAddress.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _organizationAddressProvider.CreatePostCheck(OrganizationAddress);
                //if (CheckString.Length == 0)
                //{
                    _organizationAddressProvider.CreatePost(OrganizationAddress);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _organizationAddressProvider.IndexGet(CurrentUser.Id, Id));
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

                var Address = await _organizationAddressProvider.UpdateGet(CurrentUser.Id, Id);
                Address.AddressTypes = await _addressTypeProvider.List(CurrentUser.Id);
                Address.Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                return Ok(Address);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                OrganizationAddress.UserId = CurrentUser.Id;
                //var CheckString = await _OrganizationAddressProvider.UpdatePostCheck(OrganizationAddress);
                //if (CheckString.Length == 0)
                //{
                _organizationAddressProvider.UpdatePost(OrganizationAddress);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationAddressDeleteGet OrganizationAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                OrganizationAddress.CreatorId = CurrentUser.Id;
                //var CheckString = await _OrganizationAddressProvider.DeletePostCheck(OrganizationAddress);
                //if (CheckString.Length == 0)
                //{
                _organizationAddressProvider.DeletePost(OrganizationAddress.OrganizationAddressId);
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