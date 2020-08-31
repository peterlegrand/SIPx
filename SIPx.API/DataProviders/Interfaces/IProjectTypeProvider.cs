using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypeProvider
    {
        Task<string> CreatePost(ProjectTypeCreateGet ProjectType);
        Task<string> CreatePostCheck(ProjectTypeCreatePost ProjectType);
        Task<ProjectTypeDeleteGet> DeleteGet(string UserId, int ProjectTypeId);
        bool DeletePost(int Id);
        Task<List<ProjectTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProjectTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectTypeLanguageId);
        Task<List<ProjectTypeList>> List(string UserId);
        Task<ProjectTypeUpdateGet> UpdateGet(string UserId, int ProjectTypeId);
        bool UpdatePost(ProjectTypeUpdateGet ProjectType);
    }
}