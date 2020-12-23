using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontClassificationValueController : Controller
    {
        private readonly IFrontClassificationValueProvider _frontClassificationValueProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontClassificationValueController(IFrontClassificationValueProvider frontClassificationValueProvider,  IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _frontClassificationValueProvider = frontClassificationValueProvider;
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Dashboard/{Id:int}")]
        public async Task<IActionResult> Dashboard(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var ClassificationValue = await _frontClassificationValueProvider.Dashboard(CurrentUser.Id, Id);
                return Ok(ClassificationValue);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


    }
}
