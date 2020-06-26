using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IOrganizationProvider
    {
        Task<Organization> GetOrganization(string UserID, int OrganizationID);
        Task<OrganizationAddress> GetOrganizationAddress(string UserID, int OrganizationAddressID);
        Task<List<OrganizationAddress>> GetOrganizationAddresses(string UserID, int OrganizationID);
        Task<OrganizationLanguage> GetOrganizationLanguage(string UserID, int OrganizationLanguageID);
        Task<List<OrganizationLanguage>> GetOrganizationLanguages(string UserID, int OrganizationID);
        Task<List<Organization>> GetOrganizations(string UserID);
        Task<OrganizationTelecom> GetOrganizationTelecom(string UserID, int OrganizationTelecomID);
        Task<List<OrganizationTelecom>> GetOrganizationTelecoms(string UserID, int OrganizationID);
        Task<OrganizationType> GetOrganizationType(string UserID, int OrganizationTypeID);
        Task<OrganizationTypeLanguage> GetOrganizationTypeLanguage(string UserID, int OrganizationTypeLanguageID);
        Task<List<OrganizationTypeLanguage>> GetOrganizationTypeLanguages(string UserID, int OrganizationTypeID);
        Task<List<OrganizationType>> GetOrganizationTypes(string UserID);
    }
}