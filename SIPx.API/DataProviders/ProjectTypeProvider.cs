
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

        public async Task<string> CreatePostCheck(ProjectTypeCreatePost ProjectType)
        {
            string usp = "usp_ProjectTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectType);
            return CheckString;
        }

        public async Task<string> CreatePost(ProjectTypeCreateGet ProjectType)
        {
            string usp = "usp_ProjectTypeCreatePost @Name, @Description, @MenuName, @MouseOver, @Color ,@IconID, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectType);
            return String;
        }

        public Task<List<ProjectTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProjectTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProjectTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProjectTypeUpdateGet> UpdateGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeUpdateGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }

        public bool UpdatePost(ProjectTypeUpdateGet ProjectType)
        {
            string usp = "usp_ProjectTypeUpdatePost @ProjectTypeId, @Color, @IconId, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ProjectTypeUpdateGet>(usp, ProjectType);
            return true;
        }

        public Task<ProjectTypeDeleteGet> DeleteGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeDeleteGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeDeleteGet, dynamic>(usp, new { UserId, ProjectTypeId });

        }

        public bool DeletePost(int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeDeletePost @ProjectTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProjectTypeId = ProjectTypeId });
            return true;
        }

        public Task<List<ProjectTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeLanguageIndexGet @UserId, @ProjectTypeID";
            return _sqlDataAccess.LoadData<ProjectTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }

        public Task<ProjectTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectTypeLanguageId)
        {
            string usp = "usp_ProjectTypeLanguageUpdateGet @UserId, @ProjectTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeLanguageId = ProjectTypeLanguageId });

        }

        public async Task<List<ProjectTypeList>> List(string UserId)
        {
            string usp = "usp_ProjectTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProjectTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
