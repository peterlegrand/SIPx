
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

        public async Task<List<ErrorMessage>> CreatePostCheck(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomCreatePostCheck @OrganizationId , @TelecomTypeId , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationTelecom);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomCreatePost  @OrganizationId , @TelecomTypeId , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationTelecom);
            return CheckString;
        }

        public Task<List<OrganizationTelecomIndexGet>> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationTelecomIndexGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadData<OrganizationTelecomIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }

        public Task<OrganizationTelecomUpdateGet> UpdateGet(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecomUpdateGet @UserId, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecomUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationTelecomId = OrganizationTelecomId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomUpdatePostCheck @OrganizationTelecomId , @TelecomValue, @CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationTelecom);
            return ErrorMessages;
        }
        public bool UpdatePost(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            string usp = "usp_OrganizationTelecomUpdatePost @OrganizationTelecomId , @TelecomValue, @CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId";
            _sqlDataAccess.SaveData<OrganizationTelecomUpdateGet>(usp, OrganizationTelecom);
            return true;
        }

        public Task<OrganizationTelecomDeleteGet> DeleteGet(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecomDeleteGet @UserId, @OrganizationTelecomID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTelecomDeleteGet, dynamic>(usp, new { UserId, OrganizationTelecomId });

        }

        public async Task<List<ErrorMessage>> DeletePost(string UserId, int OrganizationTelecomId)
        {
            string usp = "usp_OrganizationTelecomDeletePost @UserId, @OrganizationTelecomID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationTelecomId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationTelecomId });
            return ErrorMessages;
        }

    }
}
