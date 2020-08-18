using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTypeProvider
    {
        Task<string> CreatePost(OrganizationTypeCreatePost OrganizationType);
        Task<string> CreatePostCheck(OrganizationTypeCreatePost OrganizationType);
        Task<List<OrganizationTypeIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationTypeLanguage>> LanguageIndexGet(string UserId, int OrganizationTypeId);
        Task<OrganizationTypeLanguage> LanguageUpdateGet(string UserId, int OrganizationTypeLanguageId);
        Task<List<OrganizationTypeList>> List(string UserId);
        Task<OrganizationType> UpdateGet(string UserId, int OrganizationTypeId);
        bool UpdatePost(OrganizationTypeUpdateGet OrganizationType);
    }
}