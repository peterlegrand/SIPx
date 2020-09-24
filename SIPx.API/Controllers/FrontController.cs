using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.DataProviders;
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
        private readonly IUserPreferenceProvider _userPreferenceProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontController(IUserPreferenceProvider userPreferenceProvider, IProcessProvider processProvider, IFrontProcessProvider frontProcessProvider, IContentProvider contentProvider, IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userPreferenceProvider = userPreferenceProvider;
            _processProvider = processProvider;
            _frontProcessProvider = frontProcessProvider;
            _contentProvider = contentProvider;
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id}")]
        public async Task<IActionResult> Index(int Id)
        {
            
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                if (Id == 0)
                {
                    var PageOfUser = await _userPreferenceProvider.GetOnePreference(CurrentUser.Id, 2);
                    Id = PageOfUser.IntPreference;
                }
                    var dashboard = await _frontProvider.FrontIndexGetDashboard(CurrentUser.Id, Id);
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
                    if (panel.PageSectionTypeId == 1 & panel.PageSectionDataTypeId == 1)  //List content
                    {
                        var ContentList = await _contentProvider.ContentForPanel(CurrentUser.Id);
                        panel.Contents = ContentList;
                    }
                    if (panel.PageSectionTypeId == 1 & panel.PageSectionDataTypeId == 2)  //List Todo
                    {
                        var x = new ToDo(_processProvider);
                        var ContentList = await x.GetList(CurrentUser.Id, CurrentUser.SecurityLevelId);
                        panel.ToDos = ContentList;
                    }
                }
                dashboard.Panels = panels;
                return Ok(dashboard);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}
