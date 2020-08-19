using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<List<ClassificationCreateGetSequence>> CreateGetSequence(string UserId);
        bool CreatePost(ClassificationCreatePost Classification);
        Task<string> CreatePostCheck(ClassificationCreatePost Classification);
        Task<ClassificationDeleteGet> DeleteGet(string UserId, int ClassificationId);
        bool DeletePost(int Id);
        Task<List<ClassificationIndexGet>> IndexGet(string UserId);
        Task<List<ClassificationLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationId);
        Task<ClassificationLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLanguageId);
        Task<List<LanguageList>> LangugageCreateGetLanguageList(string UserId, int ClassificationId);
        Task<List<ClassificationList>> List(string UserId);
        Task<ClassificationUpdateGet> UpdateGet(string UserId, int ClassificationId);
        bool UpdatePost(ClassificationUpdateGet Classification);
        Task<string> UpdatePostCheck(ClassificationUpdateGet Classification);
    }
}