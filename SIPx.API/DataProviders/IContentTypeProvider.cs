using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeProvider
    {
        Task<string> CreatePost(ContentTypeCreatePost ContentType);
        Task<string> CreatePostCheck(ContentTypeCreatePost ContentType);
        Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId);
        bool DeletePost(int Id);
        Task<List<ContentType>> IndexGet(string UserId);
        Task<List<ContentTypeLanguage>> LanguageIndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeLanguage> LanguageUpdateGet(string UserId, int ContentTypeLanguageId);
        Task<List<ContentTypeList>> List(string UserId);
        Task<ContentTypeUpdateGet> UpdateGet(string UserId, int ContentTypeId);
        bool UpdatePost(ContentTypeUpdateGet ContentType);
    }
}