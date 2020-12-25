using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<List<OrganizationAdvancedSearchResult>> AdvancedSearch(OrganizationAdvancedSearchPost AdvancedSearch);
        Task<string> CreatePost(OrganizationCreateGet Organization);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationCreateGet Organization);
        Task<OrganizationDeleteGet> DeleteGet(string UserId, int OrganizationId);
        bool DeletePost(string UserId, int OrganizationId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationId);
        Task<List<OrganizationIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationId);
        Task<List<OrganizationList>> List(string UserId);
        Task<List<OrganizationList>> ListofUser(string UserId);
        Task<int> MainOrganizationIDPerUser(string UserId);
        Task<List<int>> OrganizationIDsPerUser(string UserId);
        Task<List<OrganizationForPanel>> Panel(string UserId, string OrganizationConditionSQLFrom, string OrganizationConditionSQLWhere, string OrganizationConditionSQLContains);
        Task<List<OrganizationForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<OrganizationSearch>> Search(string Contains, string UserId);
        Task<OrganizationUpdateGet> UpdateGet(string UserId, int OrganizationId);
        bool UpdatePost(OrganizationUpdateGet Organization);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationUpdateGet Organization);
    }
}