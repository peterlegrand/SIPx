using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IHomeProvider
    {
        Task<int> HomeDefaultHomePage();
        Task<List<AppointmentData>> HomeIndexEventCalendar();
        Task<FrontIndexGetDashboard> HomeIndexGetDashboard();
        Task<List<FrontIndexGetPanels>> HomeIndexGetPanels();
        Task<List<AppointmentData>> HomeIndexOrganizationCalendar(int OrganizationId);
        Task<List<AppointmentData>> HomeIndexPersonalCalendar(string UserId);
        Task<List<AppointmentData>> HomeIndexProjectCalendar(int ProjectId);
        Task<int> IntSetting(int SettingId);
        Task<string> StringSetting(int SettingId);
    }
}