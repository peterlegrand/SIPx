
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

        public async Task<List<ProjectLanguageIndexGet>> ProjectLanguageIndexGet(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectLanguageIndexGet @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<ProjectLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }
        public Task<ProjectLanguageUpdateGet> ProjectLanguageUpdateGet(string UserId, int ProjectLanguageId)
        {
            string usp = "usp_ProjectLanguageUpdateGet @UserId, @ProjectLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProjectLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectLanguageId = ProjectLanguageId });

        }
        public async Task<List<ProjectIndexGet>> ProjectIndexGet(string UserId)
        {
            string usp = "usp_ProjectIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ProjectUpdateGet> ProjectUpdateGet(string UserId, int ProjectId)
        {
            string usp = "usp_ProjectUpdateGet @UserId, @ProjectID";
            return _sqlDataAccess.LoadSingleRecord<ProjectUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });

        }
        public Task<List<ProjectTypeLanguageIndexGet>> ProjectTypeLanguageIndexGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeLanguageIndexGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadData<ProjectTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }
        public Task<ProjectTypeLanguageUpdateGet> ProjectTypeLanguageUpdateGet(string UserId, int ProjectTypeLanguageId)
        {
            string usp = "usp_ProjectTypeLanguageUpdateGet @UserId, @ProjectTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeLanguageId = ProjectTypeLanguageId });

        }
        public Task<List<ProjectTypeIndexGet>> ProjectTypeIndexGet(string UserId)
        {
            string usp = "usp_ProjectTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProjectTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProjectTypeUpdateGet> ProjectTypeUpdateGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeUpdateGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }
        public async Task<List<ProjectTypeList>> ProjectTypeList(string UserId)
        {
            string usp = "usp_ProjectTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<string> ProjectCreatePost(ProjectCreatePost Project)
        {
            string usp = "usp_ProjectCreatePost @ProjectTypeId, @ParentProjectId, @StatusId, LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Project);
            return CheckString;
        }
        public async Task<string> ProjectCreatePostCheck(ProjectCreatePost Project)
        {
            string usp = "usp_ProjectCreatePost @ProjectTypeId, @ParentProjectId, @StatusId, LanguageId, @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Project);
            return CheckString;
        }

    }
}
