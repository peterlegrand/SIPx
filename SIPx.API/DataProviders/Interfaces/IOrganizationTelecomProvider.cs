using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTelecomProvider
    {
        Task<string> OrganizationTelecomCreatePost(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<string> OrganizationTelecomCreatePostCheck(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<List<OrganizationTelecom>> OrganizationTelecomIndexGet(string UserId, int OrganizationId);
        Task<OrganizationTelecom> OrganizationTelecomUpdateGet(string UserId, int OrganizationTelecomId);
    }
}