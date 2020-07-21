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
    public class PersonController : ControllerBase
    {
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonController(IOrganizationProvider organizationProvider,  IClaimCheck claimCheck, IPeopleProvider peopleProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _organizationProvider = organizationProvider;
            _claimCheck = claimCheck;
            _peopleProvider = peopleProvider;
            _userManager = userManager;
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetPersons()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _peopleProvider.PersonIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetPerson(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _peopleProvider.PersonUpdateGet(CurrentUser.Id, Id);
                var y = await _peopleProvider.GenderList(CurrentUser.Id);
                var z = await _organizationProvider.OrganizationList(CurrentUser.Id);
                var a = await _peopleProvider.UserList();
                x.Genders = y;
                x.Organizations = z;
                x.Users = a;
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