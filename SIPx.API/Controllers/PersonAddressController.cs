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
    public class PersonAddressController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonAddressController(IMasterProvider masterProvider, IClaimCheck claimCheck, IPeopleProvider peopleProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
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
                var y = await _masterProvider.CountryList(CurrentUser.Id);
                x.Countries = y;
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}