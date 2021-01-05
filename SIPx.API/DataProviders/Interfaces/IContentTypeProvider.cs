using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeProvider
    {
        Task<List<ProcessTemplateList>> CreateGetProcessTemplates(string UserId);
        Task<bool> CreatePost(ContentTypeCreateGet ContentType);
        Task<List<ErrorMessage>> CreatePostCheck(ContentTypeCreateGet ContentType);
        Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId);
        bool DeletePost(string UserId, int ContentTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypeId);
        Task<List<ContentTypeIndexGet>> IndexGet(string UserId);
        Task<List<ContentTypeList>> List(string UserId);
        Task<ContentTypeUpdateGet> UpdateGet(string UserId, int ContentTypeId);
        bool UpdatePost(ContentTypeUpdateGet ContentType);
        Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeUpdateGet ContentType);
    }
}