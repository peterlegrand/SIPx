using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationAddressProvider
    {
        Task<string> OrganizationAddressCreatePost(OrganizationAddressCreatePost OrganizationAddress);
        Task<string> OrganizationAddressCreatePostCheck(OrganizationAddressCreatePost OrganizationAddress);
        Task<List<OrganizationAddress>> OrganizationAddressIndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddress> OrganizationAddressUpdateGet(string UserId, int OrganizationAddressId);
    }
}