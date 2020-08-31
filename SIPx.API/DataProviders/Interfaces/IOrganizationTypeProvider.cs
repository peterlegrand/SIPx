using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTypeProvider
    {
        Task<string> CreatePost(OrganizationTypeCreatePost OrganizationType);
        Task<string> CreatePostCheck(OrganizationTypeCreatePost OrganizationType);
        Task<OrganizationTypeDeleteGet> DeleteGet(string UserId, int OrganizationTypeId);
        bool DeletePost(int Id);
        Task<List<OrganizationTypeIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationTypeId);
        //Task<OrganizationTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int OrganizationTypeLanguageId);
        Task<List<OrganizationTypeList>> List(string UserId);
        Task<OrganizationTypeUpdateGet> UpdateGet(string UserId, int OrganizationTypeId);
        bool UpdatePost(OrganizationTypeUpdateGet OrganizationType);
    }
}