using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationAddressProvider
    {
        Task<string> CreatePost(OrganizationAddressCreatePost OrganizationAddress);
        Task<string> CreatePostCheck(OrganizationAddressCreatePost OrganizationAddress);
        Task<List<OrganizationAddress>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddress> UpdateGet(string UserId, int OrganizationAddressId);
        bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress);
    }
}