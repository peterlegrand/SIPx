using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonPositionProvider
    {
        Task<string> CreatePost(PersonPositionCreateGet PersonPosition);
        Task<List<ErrorMessage>> CreatePostCheck(PersonPositionCreateGet PersonPosition);
        Task<PersonPositionDeleteGet> DeleteGet(string UserId, int OrganizationPersonId);
        bool DeletePost(string UserId, int OrganizationPersonId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationPersonId);
        Task<List<PersonPositionIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonPositionUpdateGet> UpdateGet(string UserId, int OrganizationPersonId);
        bool UpdatePost(PersonPositionUpdateGet PersonPosition);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonPositionUpdateGet PersonPosition);
        Task<PersonPositionDeleteGet> ViewGet(string UserId, int OrganizationPersonId);
        Task<PersonPositionCreateGet> CreateGet(string UserId, int PersonId);
    }
}