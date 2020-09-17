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
        Task<List<OrganizationLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationId);
        //Task<OrganizationLanguageUpdateGet> LanguageUpdateGet(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationList>> List(string UserId);
        Task<OrganizationUpdateGet> UpdateGet(string UserId, int OrganizationId);
        bool UpdatePost(OrganizationUpdateGet Organization);
        Task<List<OrganizationList>> ListofUser(string UserId); Task<List<OrganizationSearch>> OrganizationSearch(string Contains, string UserId)
            ;
    }
}