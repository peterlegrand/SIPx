using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<string> OrganizationCreatePost(OrganizationCreatePost Organization);
        Task<string> OrganizationCreatePostCheck(OrganizationCreatePost Organization);
        Task<List<OrganizationIndexGet>> OrganizationIndexGet(string UserId);
        Task<List<OrganizationLanguage>> OrganizationLanguageIndexGet(string UserId, int OrganizationId);
        Task<OrganizationLanguage> OrganizationLanguageUpdateGet(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationList>> OrganizationList(string UserId);
        Task<OrganizationUpdateGet> OrganizationUpdateGet(string UserId, int OrganizationId);
    }
}