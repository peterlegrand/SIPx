
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class DevFrontProvider : IFrontProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public DevFrontProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<FrontIndexGetPanels>> FrontIndexPanels(string UserId, int PageId)
        {
            List<FrontIndexGetPanels> Panels = new List<FrontIndexGetPanels>();
            Panels.Add(new FrontIndexGetPanels { PageSectionId = 1, PageSectionTypeId = 1, PageSectionDataTypeId = 1, SizeX = 4, SizeY = 4, DashboardColumn = 0, DashboardRow = 0, PageSectionTitleName = "new stories", PageSectionTitleDescription = "these are the newest content", ShowSectionTitleName = true, ShowSectionTitleDescription = false });
            Panels.Add(new FrontIndexGetPanels { PageSectionId = 2, PageSectionTypeId = 1, PageSectionDataTypeId = 1, SizeX = 4, SizeY = 4, DashboardColumn = 4, DashboardRow = 0, PageSectionTitleName = "Most visited", PageSectionTitleDescription = "these are the most popular stories", ShowSectionTitleName = true, ShowSectionTitleDescription = false });
            Panels.Add(new FrontIndexGetPanels { PageSectionId = 3, PageSectionTypeId = 4, PageSectionDataTypeId = 2, SizeX = 8, SizeY = 4, DashboardColumn = 0, DashboardRow = 4, PageSectionTitleName = "Personal calendar", PageSectionTitleDescription = "Calendar workflow with me as primary user", ShowSectionTitleName = true, ShowSectionTitleDescription = false });

            return Panels;
        }
         
        public async Task<List<AppointmentData>> FrontIndexPersonalCalendar(string UserId)
        {
            List<AppointmentData> Appointments = new List<AppointmentData>();
            Appointments.Add(new AppointmentData { Id = 1, Color = "bbbbbb", EndTime = DateTime.Now.AddHours(1), StartTime = DateTime.Now, Subject = "Lecture on biodiversity" });
            Appointments.Add(new AppointmentData { Id = 2, Color = "bbbbbb", EndTime = DateTime.Now.AddHours(4).AddDays(1), StartTime = DateTime.Now.AddDays(1), Subject = "Beach cleanup" });

            return Appointments;
        }

        public async Task<List<AppointmentData>> FrontIndexOrganizationCalendar(string UserId)
        {
            string usp = "usp_personalOrganizationCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> FrontIndexProjectCalendar(string UserId)
        {
            string usp = "usp_personalProjectCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> FrontIndexEventCalendar()
        {
            string usp = "usp_EventCalendar";
            var x = await _sqlDataAccess.LoadData<AppointmentData>(usp);
            return x;
        }

        public async Task<FrontIndexGetDashboard> FrontIndexGetDashboard(string UserId, int PageId)
        {
            FrontIndexGetDashboard Dashboard = new FrontIndexGetDashboard();
            Dashboard.PageId = 1;
            Dashboard.ShowTitleDescription = true;
            Dashboard.ShowTitleName = true;
            Dashboard.TitleDescription = "This is the sample description in top of the dashboard";
            Dashboard.TitleName = "My home page";
            return  Dashboard;

        }
    }
}
