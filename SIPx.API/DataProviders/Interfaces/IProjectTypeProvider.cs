using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypeProvider
    {
        Task<string> CreatePost(ProjectTypeCreateGet ProjectType);
        Task<string> CreatePostCheck(ProjectTypeCreatePost ProjectType);
        Task<List<ProjectType>> IndexGet(string UserId);
        Task<List<ProjectTypeLanguage>> LanguageIndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeLanguage> LanguageUpdateGet(string UserId, int ProjectTypeLanguageId);
        Task<List<ProjectTypeList>> List(string UserId);
        Task<ProjectType> UpdateGet(string UserId, int ProjectTypeId);
    }
}