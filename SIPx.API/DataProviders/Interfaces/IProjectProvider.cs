using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectProvider
    {
        Task<string> CreatePost(ProjectCreatePost Project);
        Task<string> CreatePostCheck(ProjectCreatePost Project);
        Task<ProjectDeleteGet> DeleteGet(string UserId, int ProjectId);
        bool DeletePost(int Id);
        Task<List<ProjectIndexGet>> IndexGet(string UserId);
        Task<List<ProjectLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectId);
        Task<ProjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectLanguageId);
        Task<List<ProjectList>> List(string UserId);
        Task<ProjectUpdateGet> UpdateGet(string UserId, int ProjectId);
        Task<List<ProjectList>> ListofUser(string UserId);
        bool UpdatePost(ProjectUpdateGet Project);
        Task<List<ProjectSearch>> ProjectSearch(string Contains, string UserId);

    }
}