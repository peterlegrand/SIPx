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
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class CountryController : ControllerBase
    {
        private readonly IMasterListProvider _masterListProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IMasterProvider _masterProvider;
        private readonly UserManager<SipUser> _userManager;

        public CountryController(IMasterListProvider masterListProvider, IClaimCheck claimCheck, IMasterProvider masterProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _claimCheck = claimCheck;
            _masterProvider = masterProvider;
            _userManager = userManager;
        }


        [HttpGet("List")]
        public async Task<IActionResult> GetCountryList()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _masterListProvider.CountryList(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        //[HttpGet("Update/{Id:int}")]
        //public async Task<IActionResult> GetCountry(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _masterListProvider.CountryUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
    }
}