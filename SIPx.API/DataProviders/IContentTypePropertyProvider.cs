using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypePropertyProvider
    {
        Task<string> CreatePost(ObjectTypePropertyCreateGet ContentTypeProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet ContentTypeProperty);
        Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int ContentTypePropertyId);
        bool DeletePost(string UserId, int ContentTypePropertyId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypePropertyId);
        Task<List<ObjectTypePropertyIndexGet>> IndexGet(string UserId, int ContentTypeId);
        Task<List<ObjectTypePropertyList>> List(string UserId);
        Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int ContentTypePropertyId);
        bool UpdatePost(ObjectTypePropertyUpdateGet ContentTypeProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet ContentTypeProperty);
    }
}