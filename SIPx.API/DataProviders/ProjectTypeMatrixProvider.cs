
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
    public class ProjectTypeMatrixProvider : IProjectTypeMatrixProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProjectTypeMatrixProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProjectTypeMatrixCreateGet ProjectTypeMatrix)
        {
            string usp = "usp_ProjectTypeMatrixCreatePostCheck @Name , @Description , @MenuName , @MouseOver , @FromProjectTypeId, @ToProjectTypeId, @ProjectMatrixTypeId, @UserId  ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectTypeMatrix);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProjectTypeMatrixCreateGet ProjectTypeMatrix)
        {
            string usp = "usp_ProjectTypeMatrixCreatePost @Name , @Description , @MenuName , @MouseOver , @FromProjectTypeId, @ToProjectTypeId, @ProjectMatrixTypeId, @UserId  ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectTypeMatrix);
            return String;
        }

        public Task<List<ProjectTypeMatrixIndexGet>> IndexGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypeMatrixIndexGet @UserID, @ProjectTypeId ";
            return _sqlDataAccess.LoadData<ProjectTypeMatrixIndexGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }

        public Task<ProjectTypeMatrixUpdateGet> UpdateGet(string UserId, int ProjectTypeMatrixId)
        {
            string usp = "usp_ProjectTypeMatrixUpdateGet @UserId, @ProjectTypeMatrixId ";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeMatrixUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeMatrixId = ProjectTypeMatrixId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ProjectTypeMatrixUpdateGet ProjectTypeMatrix)
        {
            string usp = "usp_ProjectTypeMatrixUpdatePostCheck @ProjectTypeMatrixId , @FromProjectTypeId , @ToProjectTypeId , @ProjectMatrixTypeId , @Name , @Description , @MenuName , @MouseOver , @IsFrom , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectTypeMatrix);
            return ErrorMessages;
        }


        public bool UpdatePost(ProjectTypeMatrixUpdateGet ProjectTypeMatrix)
        {
            string usp = "usp_ProjectTypeMatrixUpdatePost @ProjectTypeMatrixId , @FromProjectTypeId , @ToProjectTypeId , @ProjectMatrixTypeId , @Name , @Description , @MenuName , @MouseOver , @IsFrom , @UserId ";
            _sqlDataAccess.SaveData<ProjectTypeMatrixUpdateGet>(usp, ProjectTypeMatrix);
            return true;
        }

        public Task<ProjectTypeMatrixDeleteGet> DeleteGet(string UserId, int ProjectTypeMatrixId)
        {
            string usp = "usp_ProjectTypeDeleteGet @UserId, @ProjectTypeMatrixID";
            return _sqlDataAccess.LoadSingleRecord<ProjectTypeMatrixDeleteGet, dynamic>(usp, new { UserId, ProjectTypeMatrixId });

        }

        public bool DeletePost(string UserId, int ProjectTypeMatrixId)
        {
            string usp = "usp_ProjectTypeMatrixDeletePost @UserId, @ProjectTypeMatrixID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectTypeMatrixId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectTypeMatrixId)
        {
            string usp = "usp_ProjectTypeMatrixDeletePostCheck @UserId, @ProjectTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectTypeMatrixId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProjectTypeMatrixId });
            return ErrorMessages;
        }

        //public Task<List<ProjectTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectTypeId)
        //{
        //    string usp = "usp_ProjectTypeLanguageIndexGet @UserId, @ProjectTypeID";
        //    return _sqlDataAccess.LoadData<ProjectTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        //}

        //public Task<ProjectTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectTypeLanguageId)
        //{
        //    string usp = "usp_ProjectTypeLanguageUpdateGet @UserId, @ProjectTypeLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<ProjectTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypeLanguageId = ProjectTypeLanguageId });

        //}

        //public async Task<List<ProjectTypeList>> List(string UserId)
        //{
        //    string usp = "usp_ProjectTypeList @UserID";
        //    var x = await _sqlDataAccess.LoadData<ProjectTypeList, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}

    }
}
