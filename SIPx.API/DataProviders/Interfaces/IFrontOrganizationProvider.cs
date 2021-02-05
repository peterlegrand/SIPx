using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontOrganizationProvider
    {
        Task<FrontOrganizationDashboard> Dashboard(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardAddress>> DashboardAddress(string CurrentUserId, int SelectedOrganizationId);
        Task<List<FrontOrganizationDashboardContent>> DashboardContent(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardPersonPosition>> DashboardPersonPositions(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardPersonRole>> DashboardPersonRoles(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardProcess>> DashboardProcess(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardSubOrganization>> DashboardSubOrganization(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardTelecom>> DashboardTelecom(string CurrentUserId, int SelectedOrganizationId);
        Task<FrontOrganizationAdvancedSearchGet> FrontOrganizationAdvancedSearchGet(string UserId);
        Task<List<OrganizationList>> FrontOrganizationAdvancedSearchPost(FrontOrganizationAdvancedSearchGet SearchData);
        Task<string> IndexGetSubOrganizationTree(string UserId, int OrganizationId);
    }
}