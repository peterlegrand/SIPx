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
    public class MVCUIScreenController : ControllerBase
    {
        private readonly IMVCUIScreenProvider _mVCUIScreenProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public MVCUIScreenController( IMVCUIScreenProvider mVCUIScreenProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _mVCUIScreenProvider = mVCUIScreenProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }


        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _mVCUIScreenProvider.IndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


    }
}