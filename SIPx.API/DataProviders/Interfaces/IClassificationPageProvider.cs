using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationPageProvider
    {
        bool CreatePost(ClassificationPageCreatePost ClassificationPage);
        Task<string> CreatePostCheck(ClassificationPageCreatePost ClassificationPage);
        Task<ClassificationPageDeleteGet> DeleteGet(string UserId, int ClassificationPageId);
        bool DeletePost(int Id);
        Task<List<ClassificationPageIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationPageLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationPageId);
        Task<ClassificationPageLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationPageLanguageId);
        Task<List<ClassificationPageList>> List(string UserId, int ClassificationId);
        Task<ClassificationPageUpdateGet> UpdateGet(string UserId, int ClassificationPageId);
        bool UpdatePost(ClassificationPageUpdateGet ClassificationPage);
    }
}