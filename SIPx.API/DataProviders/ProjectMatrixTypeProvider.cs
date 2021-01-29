
using Dapper;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ProjectMatrixTypeProvider : IProjectMatrixTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProjectMatrixTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProjectMatrixTypeCreateGet ProjectMatrixType)
        {
            string usp = "usp_ProjectMatrixTypeCreatePostCheck @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectMatrixType);
            return ErrorMessages;
        }

        public bool CreatePost(ProjectMatrixTypeCreateGet ProjectMatrixType)
        {
            string usp = "usp_ProjectMatrixTypeCreatePost @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ProjectMatrixTypeCreateGet>(usp, ProjectMatrixType);
            return true;
        }

        public async Task<List<ProjectMatrixTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProjectMatrixTypeIndexGet @UserID";
            List<ProjectMatrixTypeIndexGet> x = await _sqlDataAccess.LoadData<ProjectMatrixTypeIndexGet, dynamic>(usp, new { UserId });
            return x;
        }

        public Task<ProjectMatrixTypeUpdateGet> UpdateGet(string UserId, int ProjectMatrixTypeId)
        {
            string usp = "usp_ProjectMatrixTypeUpdateGet @UserId, @ProjectMatrixTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectMatrixTypeUpdateGet, dynamic>(usp, new { UserId, ProjectMatrixTypeId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ProjectMatrixTypeUpdateGet ProjectMatrixType)
        {
            string usp = "usp_ProjectMatrixTypeUpdatePostCheck @ProjectMatrixTypeId, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectMatrixType);
            return ErrorMessages;
        }

        public async Task<bool> UpdatePost(ProjectMatrixTypeUpdateGet ProjectMatrixType)
        {
            string usp = "usp_ProjectMatrixTypeUpdatePost @ProjectMatrixTypeId, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            await _sqlDataAccess.SaveData<ProjectMatrixTypeUpdateGet>(usp, ProjectMatrixType);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.

        public Task<ProjectMatrixTypeDeleteGet> DeleteGet(string UserId, int ProjectMatrixTypeId)
        {
            string usp = "usp_ProjectMatrixTypeDeleteGet @UserId, @ProjectMatrixTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProjectMatrixTypeDeleteGet, dynamic>(usp, new { UserId, ProjectMatrixTypeId });

        }
        public bool DeletePost(string UserId, int ProjectMatrixTypeId)
        {
            string usp = "usp_ProjectMatrixTypeDeletePost @UserId, @ProjectMatrixTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectMatrixTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectMatrixTypeId)
        {
            string usp = "usp_ProjectMatrixTypeDeletePostCheck @UserId, @ProjectMatrixTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProjectMatrixTypeId });
            return ErrorMessages;
        }


        public async Task<List<ProjectMatrixTypeList>> List(string UserId)
        {
            string usp = "usp_ProjectMatrixTypeList @UserId";
            var x = await _sqlDataAccess.LoadData<ProjectMatrixTypeList, dynamic>(usp, new { UserId });
            return x;
        }

    }
}
