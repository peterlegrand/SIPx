
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
    public class OrganizationTelecomProvider : IOrganizationTelecomProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationTelecomProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(OrganizationTelecomCreatePost OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomCreatePostCheck @OrganizationId  , @TelecomTypeId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationTelecom);
            return CheckString;
        }
        public async Task<string> CreatePost(OrganizationTelecomCreatePost OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomCreatePost  @OrganizationId , @TelecomTypeId , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationTelecom);
            return CheckString;
        }
        public Task<List<OrganizationTelecom>> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationTelecomIndexGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadData<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public Task<OrganizationTelecom> UpdateGet(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecomUpdateGet @UserId, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecom, dynamic>(usp, new { UserId = UserId, OrganizationTelecomId = OrganizationTelecomId });

        }
        public bool UpdatePost(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomUpdatePost @OrganizationTelecomId , @TelecomTypeId , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @ModifierId";
            _sqlDataAccess.SaveData<OrganizationTelecomUpdateGet>(usp, OrganizationTelecom);
            return true;
        }

    }
}
