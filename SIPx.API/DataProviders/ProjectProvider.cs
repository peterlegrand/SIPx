
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
    public class ProjectProvider : IProjectProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProjectProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProjectCreateGet Project)
        {
            string usp = "usp_ProjectCreatePostCheck @ProjectTypeId, @ParentProjectId, @StatusId, @SecurityLevelId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Project);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProjectCreateGet Project)
        {
            string usp = "usp_ProjectCreatePost @ProjectTypeId, @ParentProjectId, @StatusId, @SecurityLevelId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Project);
            return CheckString;
        }

        public async Task<List<ProjectIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProjectIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<ProjectUpdateGet> UpdateGet(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectUpdateGet @UserId, @ProjectID";
            return _sqlDataAccess.LoadSingleRecord<ProjectUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });

        }
        public async Task<List<int>> ProjectIDsPerUser(string UserId)
        {
            string usp = "usp_ProjectIDPerUser @UserId";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, UserId);
            return x;
        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProjectUpdateGet Project)
        {
            string usp = "usp_ProjectUpdatePostCheck @ProjectId, @ProjectTypeId, @StatusId, @SecurityLevelId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Project);
            return ErrorMessages;
        }
        public bool UpdatePost(ProjectUpdateGet Project)
        {
            string usp = "usp_ProjectUpdatePost @ProjectId, @ProjectTypeId, @StatusId, @SecurityLevelId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProjectUpdateGet>(usp, Project);
            return true;
        }

        public Task<ProjectDeleteGet> DeleteGet(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectDeleteGet @UserId, @ProjectID";
            return _sqlDataAccess.LoadSingleRecord<ProjectDeleteGet, dynamic>(usp, new { UserId, ProjectId });

        }

        public bool DeletePost(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectDeletePost @UserId, @ProjectID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectDeletePostCheck @UserId, @ProjectID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProjectId });
            return ErrorMessages;
        }

        public async Task<List<ProjectLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectLanguageIndexGet @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<ProjectLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }

        public Task<ProjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectLanguageId)
        {
            string usp = "usp_ProjectLanguageUpdateGet @UserId, @ProjectLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProjectLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectLanguageId = ProjectLanguageId });

        }

        public async Task<List<ProjectList>> List(string UserId)
        {
            string usp = "usp_ProjectList @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<ProjectList>> ListofUser(string UserId)
        {
            string usp = "usp_ProjectListOfUser @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<List<ProjectSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_ProjectSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<ProjectSearch, dynamic>(usp, new { Contains, UserId });

        }
        public Task<List<ProjectAdvancedSearchResult>> AdvancedSearch(ProjectAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_ProjectAdvancedSearch @UserId, @Contains, @ParentProjectId, @ProjectTypeId, @SecurityLevelId, @StatusId, @PersonId ";
            return _sqlDataAccess.LoadData<ProjectAdvancedSearchResult, dynamic>(usp, AdvancedSearch);
        }

        public async Task<List<ProjectForPanel>> Panel(string UserId, string ProjectConditionSQLFrom, string ProjectConditionSQLWhere, string ProjectConditionSQLContains)
        {
            string usp = "usp_ProjectForPanel @UserId, @ProjectConditionSQLFrom, @ProjectConditionSQLWhere,@ProjectConditionSQLContains ";
            var x = await _sqlDataAccess.LoadData<ProjectForPanel, dynamic>(usp, new { UserId = UserId, ProjectConditionSQLFrom = ProjectConditionSQLFrom, ProjectConditionSQLWhere = ProjectConditionSQLWhere, ProjectConditionSQLContains = ProjectConditionSQLContains });
            return x;
        }
        public async Task<List<ProjectForPanelCondition>> PanelCondition(int PageSectionId)
        {
            string usp = "usp_ProjectForPanelCondition @PageSectionId";
            var x = await _sqlDataAccess.LoadData<ProjectForPanelCondition, dynamic>(usp, new { PageSectionId = PageSectionId });
            return x;
        }
    }
}
