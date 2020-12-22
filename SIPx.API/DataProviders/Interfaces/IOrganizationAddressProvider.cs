using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationAddressProvider
    {
        Task<string> CreatePost(OrganizationAddressCreatePost OrganizationAddress);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationAddressCreateGet OrganizationAddress);
        Task<OrganizationAddressDeleteGet> DeleteGet(string UserId, int OrganizationAddressId);
        bool DeletePost(int Id);
        Task<List<OrganizationAddressIndexGet>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddressUpdateGet> UpdateGet(string UserId, int OrganizationAddressId);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationAddressUpdateGet OrganizationAddress);
        bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress);
    }
}