using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<string> OrganizationAddressCreatePost(OrganizationAddressCreatePost OrganizationAddress);
        Task<string> OrganizationAddressCreatePostCheck(OrganizationAddressCreatePost OrganizationAddress);
        Task<List<OrganizationAddress>> OrganizationAddressIndexGet(string UserId, int OrganizationId);
        Task<OrganizationAddress> OrganizationAddressUpdateGet(string UserId, int OrganizationAddressId);
        Task<string> OrganizationCreatePost(OrganizationCreatePost Organization);
        Task<string> OrganizationCreatePostCheck(OrganizationCreatePost Organization);
        Task<List<OrganizationIndexGet>> OrganizationIndexGet(string UserId);
        Task<List<OrganizationLanguage>> OrganizationLanguageIndexGet(string UserId, int OrganizationId);
        Task<OrganizationLanguage> OrganizationLanguageUpdateGet(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationList>> OrganizationList(string UserId);
        Task<string> OrganizationTelecomCreatePost(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<string> OrganizationTelecomCreatePostCheck(OrganizationTelecomCreatePost OrganizationTelecom);
        Task<List<OrganizationTelecom>> OrganizationTelecomIndexGet(string UserId, int OrganizationId);
        Task<OrganizationTelecom> OrganizationTelecomUpdateGet(string UserId, int OrganizationTelecomId);
        Task<string> OrganizationTypeCreatePost(OrganizationTypeCreatePost OrganizationType);
        Task<string> OrganizationTypeCreatePostCheck(OrganizationTypeCreatePost OrganizationType);
        Task<List<OrganizationType>> OrganizationTypeIndexGet(string UserId);
        Task<List<OrganizationTypeLanguage>> OrganizationTypeLanguageIndexGet(string UserId, int OrganizationTypeId);
        Task<OrganizationTypeLanguage> OrganizationTypeLanguageUpdateGet(string UserId, int OrganizationTypeLanguageId);
        Task<List<OrganizationTypeList>> OrganizationTypeList(string UserId);
        Task<OrganizationType> OrganizationTypeUpdateGet(string UserId, int OrganizationTypeId);
        Task<OrganizationUpdateGet> OrganizationUpdateGet(string UserId, int OrganizationId);
    }
}