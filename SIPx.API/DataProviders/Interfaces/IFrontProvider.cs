using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProvider
    {
        Task<List<AppointmentData>> FrontIndexEventCalendar();
        Task<FrontIndexGetDashboard> FrontIndexGetDashboard(string UserId, int PageId);
        Task<List<AppointmentData>> FrontIndexOrganizationCalendar(string UserId);
        Task<List<FrontIndexGetPanels>> FrontIndexPanels(int PageId);
        Task<List<AppointmentData>> FrontIndexPersonalCalendar(string UserId);
        Task<List<AppointmentData>> FrontIndexProjectCalendar(string UserId);
    }
}