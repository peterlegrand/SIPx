using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationPositionProvider
    {
        Task<string> CreatePost(OrganizationPositionCreateGet OrganizationPosition);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationPositionCreateGet OrganizationPosition);
        Task<OrganizationPositionDeleteGet> DeleteGet(string UserId, int OrganizationPersonId);
        bool DeletePost(string UserId, int OrganizationPersonId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationPersonId);
        Task<List<OrganizationPositionIndexGet>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationPositionUpdateGet> UpdateGet(string UserId, int OrganizationPersonId);
        bool UpdatePost(OrganizationPositionUpdateGet OrganizationPosition);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationPositionUpdateGet OrganizationPosition);
        Task<OrganizationPositionDeleteGet> ViewGet(string UserId, int OrganizationPersonId);
        Task<string> CreateGet(string UserId, int OrganizationId);
    }
}