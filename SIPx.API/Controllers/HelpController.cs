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
    public class HelpController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public HelpController(
             ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }


        [HttpGet("Show/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                var x = await _classificationProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);

        }


    }
}