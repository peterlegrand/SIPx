using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UITermController : ControllerBase
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly IUITermLanguageCustomizationProvider _uITermProvider;

        public UITermController(UserManager<SipUser> userManager, IUITermLanguageCustomizationProvider UITermProvider)
        {
            _userManager = userManager;
            _uITermProvider = UITermProvider;
        }

        [HttpGet] //("{Controller}/{Action}/{LanguageID}")]
        public async Task<IActionResult> Get() //string Controller = "a", string Action = "b", string LanguageID = "1")
        {

            //            var CurrentUser = await _userManager.GetUserAsync(User);
            string Controller = "a";
            string Action = "b";
            string LanguageID = "41";

            return Ok(await _uITermProvider.GetUITermLanguageCustomization(Controller, Action, 41));


        }

    }
}
