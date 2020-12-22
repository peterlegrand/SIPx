using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<string> CreatePost(OrganizationCreatePost Organization);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationCreateGet Organization);
        Task<OrganizationDeleteGet> DeleteGet(string UserId, int OrganizationId);
        bool DeletePost(int Id);
        Task<List<OrganizationIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationId);
        //Task<OrganizationLanguageUpdateGet> LanguageUpdateGet(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationList>> List(string UserId);
        Task<OrganizationUpdateGet> UpdateGet(string UserId, int OrganizationId);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationUpdateGet Organization);
        bool UpdatePost(OrganizationUpdateGet Organization);
        Task<List<OrganizationList>> ListofUser(string UserId); Task<List<OrganizationSearch>> Search(string Contains, string UserId);
        Task<List<OrganizationAdvancedSearchResult>> AdvancedSearch(OrganizationAdvancedSearchPost AdvancedSearch);
        Task<List<int>> OrganizationIDsPerUser(string UserId);
        Task<int> MainOrganizationIDPerUser(string UserId);
        Task<List<OrganizationForPanel>> Panel(string UserId, string ConditionSQLFrom, string ConditionSQLWhere, string ConditionSQLContains);
        Task<List<OrganizationForPanelCondition>> PanelCondition(int PageSectionId);
    }
}