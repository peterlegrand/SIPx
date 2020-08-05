using System;
using System.Collections.Generic;
using System.Linq;
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
    public class FrontProcessController : Controller
    {
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProcessController(IClaimCheck claimCheck, IFrontProcessProvider frontProcessProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _frontProcessProvider = frontProcessProvider;
            _userManager = userManager;
        }

        [HttpGet("New")]
        public async Task<IActionResult> NewProcess()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var ListOfProcessTemplateGroups = await _frontProcessProvider.NewProcessShowTemplateGroup(CurrentUser.Id);
                var ListOfProcessTemplates = await _frontProcessProvider.NewProcessShowTemplate(CurrentUser.Id);
foreach(var group in ListOfProcessTemplateGroups)
                { var ProcessTemplates = ListOfProcessTemplates.FindAll(x => x.ProcessTemplateGroupId == group.ProcessTemplateGroupId);
                    group.templates = ProcessTemplates;
                }
                return Ok(ListOfProcessTemplateGroups);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}
