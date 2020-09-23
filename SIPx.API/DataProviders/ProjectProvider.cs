﻿
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

        public async Task<string> CreatePostCheck(ProjectCreatePost Project)
        {
            string usp = "usp_ProjectCreatePost @ProjectTypeId, @ParentProjectId, @StatusId, LanguageId, @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Project);
            return CheckString;
        }

        public async Task<string> CreatePost(ProjectCreatePost Project)
        {
            string usp = "usp_ProjectCreatePost @ProjectTypeId, @ParentProjectId, @StatusId, @SecurityLevelId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
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

        public bool DeletePost(int ProjectId)
        {
            string usp = "usp_ProjectDeletePost @ProjectId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProjectId = ProjectId });
            return true;
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

        public Task<List<ProjectSearch>>Search(string Contains, string UserId)
        {
            string usp = "usp_ProjectSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<ProjectSearch, dynamic>(usp, new { Contains, UserId });

        }
        public Task<List<ProjectAdvancedSearchResult>> AdvancedSearch(string UserId, ProjectAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_ProjectAdvancedSearch @UserId, @Contains, @ParentProjectId, @ProjectTypeId, @SecurityLevelId, @StatusId, @PersonId ";
            return _sqlDataAccess.LoadData<ProjectAdvancedSearchResult, dynamic>(usp, new { UserId, AdvancedSearch });
        }
       
    }
}
