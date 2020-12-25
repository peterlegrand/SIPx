using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectProvider
    {
        Task<List<ProjectAdvancedSearchResult>> AdvancedSearch(ProjectAdvancedSearchPost AdvancedSearch);
        Task<string> CreatePost(ProjectCreateGet Project);
        Task<List<ErrorMessage>> CreatePostCheck(ProjectCreateGet Project);
        Task<ProjectDeleteGet> DeleteGet(string UserId, int ProjectId);
        bool DeletePost(string UserId, int ProjectId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectId);
        Task<List<ProjectIndexGet>> IndexGet(string UserId);
        Task<List<ProjectLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectId);
        Task<ProjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectLanguageId);
        Task<List<ProjectList>> List(string UserId);
        Task<List<ProjectList>> ListofUser(string UserId);
        Task<List<ProjectForPanel>> Panel(string UserId, string ProjectConditionSQLFrom, string ProjectConditionSQLWhere, string ProjectConditionSQLContains);
        Task<List<ProjectForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<int>> ProjectIDsPerUser(string UserId);
        Task<List<ProjectSearch>> Search(string Contains, string UserId);
        Task<ProjectUpdateGet> UpdateGet(string UserId, int ProjectId);
        bool UpdatePost(ProjectUpdateGet Project);
        Task<List<ErrorMessage>> UpdatePostCheck(ProjectUpdateGet Project);
    }
}