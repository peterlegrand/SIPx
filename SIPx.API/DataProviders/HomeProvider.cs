
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
    public class HomeProvider : IHomeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public HomeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<int> IntSetting(int SettingId)
        {
            string usp = "usp_HomeIntSetting @SettingId";
            var x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { SettingId = SettingId });
            return x;
        }

        public async Task<string> StringSetting(int SettingId)
        {
            string usp = "usp_HomeStringSetting @SettingId";
            var x = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { SettingId = SettingId });
            return x;
        }
        public async Task<int> HomeDefaultHomePage()
        {
            string usp = "usp_HomeDefaultHomePage";
            var x = await _sqlDataAccess.LoadSingleRecord<int>(usp);
            return x;
        }

        public Task<FrontIndexGetDashboard> HomeIndexGetDashboard()
        {
            string usp = "usp_HomeIndexGetDashboard";
            return _sqlDataAccess.LoadSingleRecord<FrontIndexGetDashboard>(usp);

        }
        public async Task<List<FrontIndexGetPanels>> HomeIndexGetPanels()
        {
            string usp = "usp_HomeIndexGetPanels";
            var x = await _sqlDataAccess.LoadData<FrontIndexGetPanels>(usp);
            return x;
        }

        public async Task<List<AppointmentData>> HomeIndexPersonalCalendar(string UserId)
        {
            string usp = "usp_HomePersonalCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> HomeIndexOrganizationCalendar(int OrganizationId)
        {
            string usp = "usp_HomeOrganizationCalendar @OrganizationId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { OrganizationId = OrganizationId });
            return x;
        }

        public async Task<List<AppointmentData>> HomeIndexProjectCalendar(int ProjectId)
        {
            string usp = "usp_HomeProjectCalendar @ProjectId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { ProjectId = ProjectId });
            return x;
        }

        public async Task<List<AppointmentData>> HomeIndexEventCalendar()
        {
            string usp = "usp_HomeEventCalendar";
            var x = await _sqlDataAccess.LoadData<AppointmentData>(usp);
            return x;
        }

    }
}
