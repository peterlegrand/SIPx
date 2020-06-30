
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

        public async Task<List<OrganizationAddress>> GetOrganizationAddresses(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationAddresses @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }
        public Task<OrganizationAddress> GetOrganizationAddress(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddress @UserId, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationAddressId = OrganizationAddressId });

        }
        public async Task<List<OrganizationLanguage>> GetOrganizationLanguages(string UserId, int OrganizationId)
        {
            string usp = "usp_DateLevels @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationLanguage, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }
        public Task<OrganizationLanguage> GetOrganizationLanguage(string UserId, int OrganizationLanguageId)
        {
            string usp = "usp_DateLevel @UserId, @DOrganizationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationLanguage, dynamic>(usp, new { UserId = UserId, OrganizationLanguageId = OrganizationLanguageId });

        }
        public async Task<List<Organization>> GetOrganizations(string UserId)
        {
            string usp = "usp_Organizations @UserID";
            var x = await _sqlDataAccess.LoadData<Organization, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Organization> GetOrganization(string UserId, int OrganizationId)
        {
            string usp = "usp_Organization @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<Organization, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public Task<List<OrganizationTelecom>> GetOrganizationTelecoms(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationTelecoms @UserId, @OrganizationID";
            return _sqlDataAccess.LoadData<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public Task<OrganizationTelecom> GetOrganizationTelecom(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecom @UserId, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationTelecomId = OrganizationTelecomId });

        }
        public Task<List<OrganizationTypeLanguage>> GetOrganizationTypeLanguages(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeLanguages @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadData<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
        public Task<OrganizationTypeLanguage> GetOrganizationTypeLanguage(string UserId, int OrganizationTypeLanguageId)
        {
            string usp = "usp_OrganizationTypeLanguage @UserId, @OrganizationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeLanguageId = OrganizationTypeLanguageId });

        }
        public Task<List<OrganizationType>> GetOrganizationTypes(string UserId)
        {
            string usp = "usp_OrganizationTypes @UserID";
            return _sqlDataAccess.LoadData<OrganizationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<OrganizationType> GetOrganizationType(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationType @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationType, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
    }
}
