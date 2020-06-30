using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<Organization> GetOrganization(string UserId, int OrganizationId);
        Task<OrganizationAddress> GetOrganizationAddress(string UserId, int OrganizationAddressId);
        Task<List<OrganizationAddress>> GetOrganizationAddresses(string UserId, int OrganizationId);
        Task<OrganizationLanguage> GetOrganizationLanguage(string UserId, int OrganizationLanguageId);
        Task<List<OrganizationLanguage>> GetOrganizationLanguages(string UserId, int OrganizationId);
        Task<List<Organization>> GetOrganizations(string UserId);
        Task<OrganizationTelecom> GetOrganizationTelecom(string UserId, int OrganizationTelecomId);
        Task<List<OrganizationTelecom>> GetOrganizationTelecoms(string UserId, int OrganizationId);
        Task<OrganizationType> GetOrganizationType(string UserId, int OrganizationTypeId);
        Task<OrganizationTypeLanguage> GetOrganizationTypeLanguage(string UserId, int OrganizationTypeLanguageId);
        Task<List<OrganizationTypeLanguage>> GetOrganizationTypeLanguages(string UserId, int OrganizationTypeId);
        Task<List<OrganizationType>> GetOrganizationTypes(string UserId);
    }
}