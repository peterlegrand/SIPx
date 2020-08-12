
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
        public async Task<List<OrganizationList>> OrganizationList(string UserId)
        {
            string usp = "usp_OrganizationList @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<string> OrganizationCreatePostCheck(OrganizationCreatePost Organization)
        {
            string usp = "usp_OrganizationCreatePostCheck @ParentOrganizationId, @StatusId, @LanguageID, @name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Organization);
            return CheckString;
        }

        public async Task<string> OrganizationCreatePost(OrganizationCreatePost Organization)
        {
            string usp = "usp_OrganizationCreatePost @OrganizationTypeId, @ParentOrganizationId, @StatusId, LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Organization);
            return CheckString;
        }

    }
}
