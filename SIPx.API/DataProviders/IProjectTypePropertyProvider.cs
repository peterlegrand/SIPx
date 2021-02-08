using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypePropertyProvider
    {
        Task<string> CreatePost(ObjectTypePropertyCreateGet ProjectTypeProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet ProjectTypeProperty);
        Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int ProjectTypePropertyId);
        bool DeletePost(string UserId, int ProjectTypePropertyId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectTypePropertyId);
        Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int ProjectTypeId);
        Task<List<ObjectTypePropertyList>> List(string UserId);
        Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int ProjectTypePropertyId);
        bool UpdatePost(ObjectTypePropertyUpdateGet ProjectTypeProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet ProjectTypeProperty);
    }
}