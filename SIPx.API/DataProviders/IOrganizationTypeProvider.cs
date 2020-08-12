using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTypeProvider
    {
        Task<string> OrganizationTypeCreatePost(OrganizationTypeCreatePost OrganizationType);
        Task<string> OrganizationTypeCreatePostCheck(OrganizationTypeCreatePost OrganizationType);
        Task<List<OrganizationType>> OrganizationTypeIndexGet(string UserId);
        Task<List<OrganizationTypeLanguage>> OrganizationTypeLanguageIndexGet(string UserId, int OrganizationTypeId);
        Task<OrganizationTypeLanguage> OrganizationTypeLanguageUpdateGet(string UserId, int OrganizationTypeLanguageId);
        Task<List<OrganizationTypeList>> OrganizationTypeList(string UserId);
        Task<OrganizationType> OrganizationTypeUpdateGet(string UserId, int OrganizationTypeId);
    }
}