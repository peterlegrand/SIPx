using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueProvider
    {
        Task<string> CreatePost(ClassificationValueCreatePost ClassificationValue);
        Task<string> CreatePostCheck(ClassificationValueCreatePost ClassificationValue);
        Task<List<ClassificationValueUpdateGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId);
        Task<ClassificationValueUpdateGet> UpdateGet(string UserId, int ClassificationValueId);
        bool UpdatePost(ClassificationValueUpdateGet ClassificationValue);
        bool DeletePost(int Id);
        Task<ClassificationValueDeleteGet> DeleteGet(string UserId, int ClassificationValueId);
    }
}