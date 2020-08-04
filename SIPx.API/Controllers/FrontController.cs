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
    public class FrontController : Controller
    {
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontController(IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var panels = await _frontProvider.FrontIndexPanels(Id);
                foreach(var panel in panels)
                {
                    if (panel.PageSectionTypeId == 4 & panel.PageSectionDataTypeId == 2)  //Calendar
                    {
                        var PersonalCalendar = await _frontProvider.FrontIndexPersonalCalendar(CurrentUser.Id);
                        panel.PersonalCalendars = PersonalCalendar;
                    }
                    if (panel.PageSectionTypeId == 5 & panel.PageSectionDataTypeId == 2)  //Calendar
                    {
                        var OrganizationCalendar = await _frontProvider.FrontIndexOrganizationCalendar(CurrentUser.Id);
                        panel.OrganizationCalendars = OrganizationCalendar;
                    }
                    if (panel.PageSectionTypeId == 6 & panel.PageSectionDataTypeId == 2)  //Calendar
                    {
                        var ProjectCalendar = await _frontProvider.FrontIndexProjectCalendar(CurrentUser.Id);
                        panel.ProjectCalendars = ProjectCalendar;
                    }
                    if (panel.PageSectionTypeId == 7 & panel.PageSectionDataTypeId == 2)  //Calendar
                    {
                        var EventCalendar = await _frontProvider.FrontIndexEventCalendar();
                        panel.EventCalendars = EventCalendar;
                    }
                }
                return Ok(panels);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}
