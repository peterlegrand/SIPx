using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontOrganizationProvider
    {
        Task<FrontOrganizationDashboard> Dashboard(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardContent>> DashboardContent(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardMember>> DashboardMember(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardProcess>> DashboardProcess(string UserId, int OrganizationId);
        Task<List<FrontOrganizationDashboardSubOrganization>> DashboardSubOrganization(string UserId, int OrganizationId);
        Task<string> IndexGetSubOrganizationTree(string UserId, int OrganizationId);
        Task<FrontOrganizationAdvancedSearchGet> FrontOrganizationAdvancedSearchGet(string UserId);
        Task<List<OrganizationList>> FrontOrganizationAdvancedSearchPost(FrontOrganizationAdvancedSearchGet SearchData);
    }
}