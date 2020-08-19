using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<string> CreatePost(OrganizationCreatePost Organization);
        Task<string> CreatePostCheck(OrganizationCreatePost Organization);
        Task<OrganizationDeleteGet> DeleteGet(string UserId, int OrganizationId);
        bool DeletePost(int Id);
        Task<List<OrganizationIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationLanguage>> LanguageIndexGet(string UserId, int OrganizationId);
        Task<OrganizationLanguage> LanguageUpdateGet(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationList>> List(string UserId);
        Task<OrganizationUpdateGet> UpdateGet(string UserId, int OrganizationId);
        bool UpdatePost(OrganizationUpdateGet Organization);
    }
}