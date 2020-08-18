using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueProvider
    {
        Task<string> CreatePost(ClassificationValueCreatePost ClassificationValue);
        Task<string> CreatePostCheck(ClassificationValueCreatePost ClassificationValue);
        Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId);
        bool UpdatePost(ClassificationValueUpdateGet ClassificationValue);
        Task<List<ClassificationValueUpdateGet>> ValueIndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueUpdateGet> ValueUpdateGet(string UserId, int ClassificationValueId);
    }
}