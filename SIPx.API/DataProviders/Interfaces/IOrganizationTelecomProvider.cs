using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTelecomProvider
    {
        Task<string> CreatePost(OrganizationTelecomCreateGet OrganizationTelecom);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationTelecomCreateGet OrganizationTelecom);
        Task<OrganizationTelecomDeleteGet> DeleteGet(string UserId, int OrganizationTelecomId);
        Task<List<ErrorMessage>> DeletePost(string UserId, int OrganizationTelecomId);
        Task<List<OrganizationTelecomIndexGet>> IndexGet(string UserId, int OrganizationId);
        Task<OrganizationTelecomUpdateGet> UpdateGet(string UserId, int OrganizationTelecomId);
        bool UpdatePost(OrganizationTelecomUpdateGet OrganizationTelecom);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationTelecomUpdateGet OrganizationTelecom);
    }
}