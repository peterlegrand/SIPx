using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProvider
    {
        Task<List<AppointmentData>> FrontIndexEventCalendar();
        Task<List<AppointmentData>> FrontIndexOrganizationCalendar(string UserId);
        Task<List<FrontIndexPanels>> FrontIndexPanels(int PageId);
        Task<List<AppointmentData>> FrontIndexPersonalCalendar(string UserId);
        Task<List<AppointmentData>> FrontIndexProjectCalendar(string UserId);
    }
}