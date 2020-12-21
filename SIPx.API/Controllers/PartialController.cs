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
        private readonly IPartialProvider _partialProvider;
        private readonly IFrontUserMenuProvider _frontUserMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public PartialController(IPartialProvider partialProvider
            , IFrontUserMenuProvider frontUserMenuProvider
            , UserManager<SipUser> userManager)
        {
            _partialProvider = partialProvider;
            _frontUserMenuProvider = frontUserMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("LeftMenu")]
        public async Task<IActionResult> LeftMenu()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var Menus = await _partialProvider.PartialLeftUserMenu(CurrentUser.Id);
            foreach(var menu in Menus)
            {
                menu.Icon = "/images/icons/"+menu.Icon;
            }
            return Ok(Menus);


        }
    }
}
