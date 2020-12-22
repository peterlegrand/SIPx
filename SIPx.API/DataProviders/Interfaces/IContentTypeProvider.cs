using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeProvider
    {
        Task<bool> CreatePost(ContentTypeCreateGet ContentType);
        Task<List<ErrorMessage>> CreatePostCheck(ContentTypeCreateGet ContentType);
        Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId);
        bool DeletePost(int Id);
        Task<List<ContentTypeIndexGet>> IndexGet(string UserId);
        //Task<List<ContentTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ContentTypeId);
        //Task<ContentTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ContentTypeLanguageId);
        Task<List<ContentTypeList>> List(string UserId);
        Task<ContentTypeUpdateGet> UpdateGet(string UserId, int ContentTypeId);
        Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeUpdateGet ContentType);
        bool UpdatePost(ContentTypeUpdateGet ContentType);
        Task<List<ProcessTemplateList>> CreateGetProcessTemplates(string UserId);
    }
}