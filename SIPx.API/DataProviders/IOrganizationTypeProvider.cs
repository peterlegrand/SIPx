using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationTypeProvider
    {
        Task<string> CreatePost(OrganizationTypeCreateGet OrganizationType);
        Task<List<ErrorMessage>> CreatePostCheck(OrganizationTypeCreateGet OrganizationType);
        Task<OrganizationTypeDeleteGet> DeleteGet(string UserId, int OrganizationTypeId);
        bool DeletePost(string UserId, int OrganizationTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationTypeId);
        Task<List<OrganizationTypeIndexGet>> IndexGet(string UserId);
        Task<List<OrganizationTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationTypeId);
        Task<List<OrganizationTypeList>> List(string UserId);
        Task<OrganizationTypeUpdateGet> UpdateGet(string UserId, int OrganizationTypeId);
        bool UpdatePost(OrganizationTypeUpdateGet OrganizationType);
        Task<List<ErrorMessage>> UpdatePostCheck(OrganizationTypeUpdateGet OrganizationType);
        Task<List<OrganizationTypeList>> ListExternal(string UserId);
    }
}