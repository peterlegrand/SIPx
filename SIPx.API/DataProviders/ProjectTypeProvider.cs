
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
    public class ProjectTypeProvider : IProjectTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProjectTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<ProjectTypeLanguage>> ProjectTypeLanguageIndexGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeLanguageIndexGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadData<ProjectTypeLanguage, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }
        public Task<ProjectTypeLanguage> ProjectTypeLanguageUpdateGet(string UserId, int ProjectTypeLanguageId)
        {
            string usp = "usp_ProjectTypeLanguageUpdateGet @UserId, @ProjectTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeLanguage, dynamic>(usp, new { UserId = UserId, ProjectTypeLanguageId = ProjectTypeLanguageId });

        }
        public Task<List<ProjectType>> ProjectTypeIndexGet(string UserId)
        {
            string usp = "usp_ProjectTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProjectType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProjectType> ProjectTypeUpdateGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeUpdateGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectType, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }
        public async Task<List<ProjectTypeList>> ProjectTypeList(string UserId)
        {
            string usp = "usp_ProjectTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<string> ProjectTypeCreatePostCheck(ProjectTypeCreatePost ProjectType)
        {
            string usp = "usp_ProjectTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectType);
            return CheckString;
        }
        public async Task<string> ProjectTypeCreatePost(ProjectTypeCreateGet ProjectType)
        {
            string usp = "usp_ProjectTypeCreatePost @Name, @Description, @MenuName, @MouseOver, @Color ,@IconID, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectType);
            return String;
        }
    }
}
