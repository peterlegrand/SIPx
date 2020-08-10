using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PartialController : Controller
    {
        private readonly IUserMenuProvider _userMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public PartialController(IUserMenuProvider userMenuProvider, UserManager<SipUser> userManager)
        {
            _userMenuProvider = userMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("LeftMenu")]
        public async Task<IActionResult> LeftMenu()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var Menus = await _userMenuProvider.PartialLeftUserMenu(CurrentUser.Id);
            foreach(var menu in Menus)
            {
                menu.Icon = "/images/icons/"+menu.Icon;
            }
            return Ok(Menus);


        }
    }
}
