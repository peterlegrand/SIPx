using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTypePropertyProvider
    {
        Task<string> CreatePost(ObjectTypePropertyCreateGet OrganizationTypeProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet OrganizationTypeProperty);
        Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int OrganizationTypePropertyId);
        bool DeletePost(string UserId, int OrganizationTypePropertyId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationTypePropertyId);
        Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int OrganizationTypeId);
        Task<List<ObjectTypePropertyList>> List(string UserId);
        Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int OrganizationTypePropertyId);
        bool UpdatePost(ObjectTypePropertyUpdateGet OrganizationTypeProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet OrganizationTypeProperty);
    }
}