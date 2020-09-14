
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

        public async Task<string> CreatePostCheck(OrganizationCreatePost Organization)
        {
            string usp = "usp_OrganizationCreatePostCheck @ParentOrganizationId, @StatusId, @LanguageID, @name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Organization);
            return CheckString;
        }

        public async Task<string> CreatePost(OrganizationCreatePost Organization)
        {
            string usp = "usp_OrganizationCreatePost @ParentOrganizationId, @StatusId, @OrganizationTypeID, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Organization);
            return CheckString;
        }

        public async Task<List<OrganizationIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_OrganizationIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<OrganizationUpdateGet> UpdateGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationUpdateGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }

        public bool UpdatePost(OrganizationUpdateGet Organization)
        {
            string usp = "usp_OrganizationUpdatePost @OrganizationId , @ParentOrganizationId, @StatusId, @OrganizationTypeID, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<OrganizationUpdateGet>(usp, Organization);
            return true;
        }

        public Task<OrganizationDeleteGet> DeleteGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationDeleteGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationDeleteGet, dynamic>(usp, new { UserId, OrganizationId });

        }

        public bool DeletePost(int OrganizationId)
        {
            string usp = "usp_OrganizationDeletePost @OrganizationId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { OrganizationId = OrganizationId });
            return true;
        }

        public async Task<List<OrganizationLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationLanguageIndexGet @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<OrganizationLanguageIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        //public Task<OrganizationLanguageUpdateGet> LanguageUpdateGet(string UserId, int OrganizationLanguageId)
        //{
        //    string usp = "usp_OrganizationLanguageUpdateGet @UserId, @OrganizationLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<OrganizationLanguage, dynamic>(usp, new { UserId = UserId, OrganizationLanguageId = OrganizationLanguageId });

        //}

        public async Task<List<OrganizationList>> List(string UserId)
        {
            string usp = "usp_OrganizationList @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<OrganizationList>> ListofUser(string UserId)
        {
            string usp = "usp_OrganizationListOfUser @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
