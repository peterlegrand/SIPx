using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationAddressProvider
    {
        Task<string> CreatePost(OrganizationAddressCreatePost OrganizationAddress);
        Task<string> CreatePostCheck(OrganizationAddressCreatePost OrganizationAddress);
        Task<OrganizationAddressDeleteGet> DeleteGet(string UserId, int OrganizationAddressId);
        bool DeletePost(int Id);
        Task<List<OrganizationAddressIndexGet>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddressUpdateGet> UpdateGet(string UserId, int OrganizationAddressId);
        bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress);
    }
}