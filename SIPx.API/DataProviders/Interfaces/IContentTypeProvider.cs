using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeProvider
    {
        Task<string> ContentTypeCreatePost(ContentTypeCreatePost ContentType);
        Task<string> ContentTypeCreatePostCheck(ContentTypeCreatePost ContentType);
        Task<List<ContentType>> ContentTypeIndexGet(string UserId);
        Task<List<ContentTypeLanguage>> ContentTypeLanguageIndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeLanguage> ContentTypeLanguageUpdateGet(string UserId, int ContentTypeLanguageId);
        Task<List<ContentTypeList>> ContentTypeList(string UserId);
        Task<ContentType> ContentTypeUpdateGet(string UserId, int ContentTypeId);
    }
}