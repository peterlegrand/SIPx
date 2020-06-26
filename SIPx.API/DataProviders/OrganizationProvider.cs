
using Dapper;
using SIPx.API.ViewModels;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class OrganizationProvider : IOrganizationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<OrganizationAddress>> GetOrganizationAddresses(string UserID, int OrganizationID)
        {
            string usp = "usp_OrganizationAddresses @UserID, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<Country, dynamic>(usp, new { UserID = UserID, OrganizationID = OrganizationID });
            return x;
        }
        public Task<OrganizationAddress> GetOrganizationAddress(string UserID, int OrganizationAddressID)
        {
            string usp = "usp_OrganizationAddress @UserID, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddress, dynamic>(usp, new { UserID = UserID, OrganizationAddressID = OrganizationAddressID });

        }
        public async Task<List<OrganizationLanguage>> GetOrganizationLanguages(string UserID, int OrganizationID)
        {
            string usp = "usp_DateLevels @UserID, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationLanguage, dynamic>(usp, new { UserID = UserID, OrganizationID = OrganizationID });
            return x;
        }
        public Task<OrganizationLanguage> GetOrganizationLanguage(string UserID, int OrganizationLanguageID)
        {
            string usp = "usp_DateLevel @UserID, @DOrganizationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationLanguage, dynamic>(usp, new { UserID = UserID, OrganizationLanguageID = OrganizationLanguageID });

        }
        public async Task<List<Organization>> GetOrganizations(string UserID)
        {
            string usp = "usp_Organizations @UserID";
            var x = await _sqlDataAccess.LoadData<Organization, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Organization> GetOrganization(string UserID, int OrganizationID)
        {
            string usp = "usp_Organization @UserID, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<Organization, dynamic>(usp, new { UserID = UserID, OrganizationID = OrganizationID });

        }
        public Task<List<OrganizationTelecom>> GetOrganizationTelecoms(string UserID, int OrganizationID)
        {
            string usp = "usp_OrganizationTelecoms @UserID, @OrganizationID";
            return _sqlDataAccess.LoadData<OrganizationTelecom, dynamic>(usp, new { UserID = UserID, OrganizationID = OrganizationID });

        }
        public Task<OrganizationTelecom> GetOrganizationTelecom(string UserID, int OrganizationTelecomID)
        {
            string usp = "usp_OrganizationTelecom @UserID, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecom, dynamic>(usp, new { UserID = UserID, OrganizationTelecomID = OrganizationTelecomID });

        }
        public Task<List<OrganizationTypeLanguage>> GetOrganizationTypeLanguages(string UserID, int OrganizationTypeID)
        {
            string usp = "usp_OrganizationTypeLanguages @UserID, @OrganizationTypeID";
            return _sqlDataAccess.LoadData<OrganizationTypeLanguage, dynamic>(usp, new { UserID = UserID, OrganizationTypeID = OrganizationTypeID });

        }
        public Task<OrganizationTypeLanguage> GetOrganizationTypeLanguage(string UserID, int OrganizationTypeLanguageID)
        {
            string usp = "usp_OrganizationTypeLanguage @UserID, @OrganizationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeLanguage, dynamic>(usp, new { UserID = UserID, OrganizationTypeLanguageID = OrganizationTypeLanguageID });

        }
        public Task<List<OrganizationType>> GetOrganizationTypes(string UserID)
        {
            string usp = "usp_OrganizationTypes @UserID";
            return _sqlDataAccess.LoadData<OrganizationType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<OrganizationType> GetOrganizationType(string UserID, int OrganizationTypeID)
        {
            string usp = "usp_OrganizationType @UserID, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationType, dynamic>(usp, new { UserID = UserID, OrganizationTypeID = OrganizationTypeID });

        }
    }
}
