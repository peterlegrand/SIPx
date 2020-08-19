﻿using System;
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
    public class PersonAddressController : ControllerBase
    {
        private readonly IPersonAddressProvider _personAddressProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonAddressController(IPersonAddressProvider personAddressProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IPeopleProvider peopleProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personAddressProvider = personAddressProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _peopleProvider = peopleProvider;
            _userManager = userManager;
        }


        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> GetPersonAddresses(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _peopleProvider.PersonAddressIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetPersonAddress(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _peopleProvider.PersonAddressUpdateGet(CurrentUser.Id, Id);
                var y = await _masterListProvider.CountryList(CurrentUser.Id);
                x.Countries = y;
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PersonAddressCreateGet = new PersonAddressCreateGet();
                var AddressTypes = await _masterListProvider.AddressTypeList(CurrentUser.Id);
                var Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                PersonAddressCreateGet.AddressTypes = AddressTypes;
                PersonAddressCreateGet.Countries = Countries;
                PersonAddressCreateGet.PersonId = Id;
                return Ok(PersonAddressCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(PersonAddressCreatePost PersonAddress)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonAddress.CreatorId= CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _peopleProvider.PersonAddressCreatePostCheck(PersonAddress);
                if (CheckString.Length == 0)
                {
                    _peopleProvider.PersonAddressCreatePost(PersonAddress);
                    return Ok(PersonAddress);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
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
                if (await _checkProvider.CheckIfRecordExists("PersonAddresss", "PersonAddressID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PersonAddress.CreatorId = CurrentUser.Id;
                //var CheckString = await _PersonAddressProvider.DeletePostCheck(PersonAddress);
                //if (CheckString.Length == 0)
                //{
                _personAddressProvider.DeletePost(PersonAddress.PersonAddressId);
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