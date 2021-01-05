using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationAddressProvider
    {
        Task<string> CreatePost(OrganizationAddressCreateGet OrganizationAddress);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationAddressCreateGet OrganizationAddress);
        Task<OrganizationAddressDeleteGet> DeleteGet(string UserId, int OrganizationAddressId);
        bool DeletePost(string UserId, int OrganizationAddressId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationAddressId);
        Task<List<OrganizationAddressIndexGet>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddressUpdateGet> UpdateGet(string UserId, int OrganizationAddressId);
        bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationAddressUpdateGet OrganizationAddress);
    }
}