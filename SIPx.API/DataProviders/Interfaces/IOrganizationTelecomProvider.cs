using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTelecomProvider
    {
        Task<string> CreatePost(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<string> CreatePostCheck(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<OrganizationTelecomDeleteGet> DeleteGet(string UserId, int OrganizationTelecomId);
        bool DeletePost(int Id);
        Task<List<OrganizationTelecom>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationTelecom> UpdateGet(string UserId, int OrganizationTelecomId);
        bool UpdatePost(OrganizationTelecomUpdateGet OrganizationTelecom);
    }
}