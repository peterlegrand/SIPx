
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

        public async Task<List<ErrorMessage>> CreatePostCheck(OrganizationCreateGet Organization)
        {
            string usp = "usp_OrganizationCreatePostCheck @ParentOrganizationId, @StatusId, @OrganizationTypeID, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Organization);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(OrganizationCreateGet Organization)
        {
            string usp = "usp_OrganizationCreatePost @ParentOrganizationId, @StatusId, @OrganizationTypeID, @Name, @Description, @MenuName, @MouseOver, @UserId";
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
        public Task<string> GetOrganizationName(string UserId, int OrganizationId)
        {
            string usp = "usp_GetOrganizationName @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(OrganizationUpdateGet Organization)
        {
            string usp = "usp_OrganizationUpdatePostCheck @OrganizationId , @ParentOrganizationId, @StatusId, @OrganizationTypeID, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Organization);
            return ErrorMessages;
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

        public bool DeletePost(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationDeletePost @UserId, @OrganizationID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationDeletePostCheck @UserId, @OrganizationID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationId });
            return ErrorMessages;
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
        public Task<List<OrganizationSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_OrganizationSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<OrganizationSearch, dynamic>(usp, new { Contains, UserId });

        }
        public Task<List<OrganizationAdvancedSearchResult>> AdvancedSearch(OrganizationAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_OrganizationAdvancedSearch @UserId, @Contains, @ParentOrganizationId, @OrganizationTypeId, @StatusId, @PersonId ";
            return _sqlDataAccess.LoadData<OrganizationAdvancedSearchResult, dynamic>(usp, AdvancedSearch);
        }
        public async Task<List<int>> OrganizationIDsPerUser(string UserId)
        {
            string usp = "usp_OrganizationIDPerUser @UserId";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, UserId);
            return x;
        }
        public Task<int> MainOrganizationIDPerUser(string UserId)
        {
            string usp = "usp_MainOrganizationIDPerUser @UserId";
            return _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, UserId);
        }
        public async Task<List<OrganizationForPanel>> Panel(string UserId, string OrganizationConditionSQLFrom, string OrganizationConditionSQLWhere, string OrganizationConditionSQLContains)
        {
            string usp = "usp_OrganizationForPanel @UserId, @OrganizationConditionSQLFrom, @OrganizationConditionSQLWhere,@OrganizationConditionSQLContains ";
            var x = await _sqlDataAccess.LoadData<OrganizationForPanel, dynamic>(usp, new { UserId = UserId, OrganizationConditionSQLFrom = OrganizationConditionSQLFrom, OrganizationConditionSQLWhere = OrganizationConditionSQLWhere, OrganizationConditionSQLContains = OrganizationConditionSQLContains });
            return x;
        }
        public async Task<List<OrganizationForPanelCondition>> PanelCondition(int PageSectionId)
        {
            string usp = "usp_OrganizationForPanelCondition @PageSectionId";
            var x = await _sqlDataAccess.LoadData<OrganizationForPanelCondition, dynamic>(usp, new { PageSectionId = PageSectionId });
            return x;
        }

    }
}
