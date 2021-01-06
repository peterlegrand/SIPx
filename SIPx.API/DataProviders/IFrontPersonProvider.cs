using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontPersonProvider
    {
        Task<string> CreatePost(FrontPersonCreateGet Person);
        Task<List<ErrorMessage>> CreatePostCheck(FrontPersonCreateGet Person);
        Task<FrontPersonDashboard> Dashboard(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardAddress>> DashboardAddress(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardContent>> DashboardContent(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardOrganization>> DashboardOrganization(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardProcess>> DashboardProcess(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardProject>> DashboardProject(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontPersonDashboardTelecom>> DashboardTelecom(string CurrentUserId, int SelectedPersonId);
        Task<FrontPersonAdvancedSearchGet> FrontPersonAdvancedSearchGet(string UserId);
        Task<List<FrontPersonSearchResult>> FrontPersonAdvancedSearchPost(FrontPersonAdvancedSearchGet SearchData);
        Task<FrontPersonUpdateGet> UpdateGet(string UserId, int PersonId);
        Task<int> UpdateGetCheckIfNonUser(int SelectedPersonId);
        bool UpdatePost(FrontPersonUpdateGet Person);
        Task<List<ErrorMessage>> UpdatePostCheck(FrontPersonUpdateGet Person);
    }
}