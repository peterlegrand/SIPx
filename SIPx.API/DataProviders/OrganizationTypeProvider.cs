
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
    public class OrganizationTypeProvider : IOrganizationTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
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
        public Task<List<OrganizationTypeIndexGet>> OrganizationTypeIndexGet(string UserId)
        {
            string usp = "usp_OrganizationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<OrganizationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<OrganizationType> OrganizationTypeUpdateGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeUpdateGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationType, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
        public async Task<List<OrganizationTypeList>> OrganizationTypeList(string UserId)
        {
            string usp = "usp_OrganizationTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<string> OrganizationTypeCreatePostCheck(OrganizationTypeCreatePost OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationType);
            return CheckString;
        }
        public async Task<string> OrganizationTypeCreatePost(OrganizationTypeCreatePost OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePost @Internal, @LegalEntity,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationType);
            return String;
        }
    }
}
