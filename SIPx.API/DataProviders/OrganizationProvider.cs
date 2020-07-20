
using Dapper;
using SIPx.Shared;
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

        public async Task<List<OrganizationAddress>> OrganizationAddressIndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationAddressIndexGet @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }
        public Task<OrganizationAddress> OrganizationAddressUpdateGet(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressUpdateGet @UserId, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationAddressId = OrganizationAddressId });

        }
        public async Task<List<OrganizationLanguage>> OrganizationLanguageIndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationLanguageIndexGet @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<OrganizationLanguage, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }
        public Task<OrganizationLanguage> OrganizationLanguageUpdateGet(string UserId, int OrganizationLanguageId)
        {
            string usp = "usp_OrganizationLanguageUpdateGet @UserId, @OrganizationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationLanguage, dynamic>(usp, new { UserId = UserId, OrganizationLanguageId = OrganizationLanguageId });

        }
        public async Task<List<OrganizationIndexGet>> OrganizationIndexGet(string UserId)
        {
            string usp = "usp_OrganizationIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<OrganizationUpdateGet> OrganizationUpdateGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationUpdateGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public Task<List<OrganizationTelecom>> OrganizationTelecomIndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationTelecomIndexGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadData<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public Task<OrganizationTelecom> OrganizationTelecomUpdateGet(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecomUpdateGet @UserId, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationTelecomId = OrganizationTelecomId });

        }
        public Task<List<OrganizationTypeLanguage>> OrganizationTypeLanguageIndexGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeLanguageIndexGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadData<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
        public Task<OrganizationTypeLanguage> OrganizationTypeLanguageUpdateGet(string UserId, int OrganizationTypeLanguageId)
        {
            string usp = "usp_OrganizationTypeLanguageUpdateGet @UserId, @OrganizationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeLanguageId = OrganizationTypeLanguageId });

        }
        public Task<List<OrganizationType>> OrganizationTypeIndexGet(string UserId)
        {
            string usp = "usp_OrganizationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<OrganizationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<OrganizationType> OrganizationTypeUpdateGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeUpdateGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationType, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
    }
}
