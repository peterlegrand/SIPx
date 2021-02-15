using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonTypePropertyProvider
    {
        Task<string> CreatePost(ObjectTypePropertyCreateGet PersonTypeProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet PersonTypeProperty);
        Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int PersonTypePropertyId);
        bool DeletePost(string UserId, int PersonTypePropertyId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTypePropertyId);
        Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int PersonTypeId);
        Task<List<ObjectTypePropertyList>> List(string UserId);
        Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int PersonTypePropertyId);
        bool UpdatePost(ObjectTypePropertyUpdateGet PersonTypeProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet PersonTypeProperty);
    }
}