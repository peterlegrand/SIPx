using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypeProvider
    {
        Task<string> ProjectTypeCreatePost(ProjectTypeCreatePost ProjectType);
        Task<string> ProjectTypeCreatePostCheck(ProjectTypeCreatePost ProjectType);
        Task<List<ProjectType>> ProjectTypeIndexGet(string UserId);
        Task<List<ProjectTypeLanguage>> ProjectTypeLanguageIndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeLanguage> ProjectTypeLanguageUpdateGet(string UserId, int ProjectTypeLanguageId);
        Task<List<ProjectTypeList>> ProjectTypeList(string UserId);
        Task<ProjectType> ProjectTypeUpdateGet(string UserId, int ProjectTypeId);
    }
}