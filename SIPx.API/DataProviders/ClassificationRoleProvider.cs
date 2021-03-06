﻿
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ClassificationRoleProvider : IClassificationRoleProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationRoleProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationRoleCreateGet ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePostCheck @RoleId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationRole);
            return ErrorMessages;
        }

        public bool CreatePost(ClassificationRoleCreateGet ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePost @RoleId, @ClassificationId, @ClassificationRelationTypeId, @UserID";
            _sqlDataAccess.SaveData<ClassificationRoleCreateGet>(usp, ClassificationRole);
            return true;
        }

        public Task<List<ClassificationRoleIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationRoleIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationRoleIndexGet, dynamic>(usp, new { UserId, ClassificationId });

        }

        public Task<ClassificationRoleUpdateGet> UpdateGet(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleUpdateGet @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationRoleId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationRoleUpdateGet ClassificationRole)
        {
            string usp = "usp_ClassificationRoleUpdatePostCheck @RoleId, @ClassificationRoleId, @ClassificationRelationTypeId, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationRole);
            return ErrorMessages;
        }

        public bool UpdatePost(ClassificationRoleUpdateGet ClassificationRole)
        {
            string usp = "usp_ClassificationRoleUpdatePost @RoleId, @ClassificationRoleId, @ClassificationRelationTypeId, @UserID";
            _sqlDataAccess.SaveData<ClassificationRoleUpdateGet>(usp, ClassificationRole);
            return true;
        }

        public Task<ClassificationRoleDeleteGet> DeleteGet(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleDeleteGet @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRoleDeleteGet, dynamic>(usp, new { UserId, ClassificationRoleId });

        }

        public bool DeletePost(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleDeletePost @UserId, @ClassificationRoleID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationRoleId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleDeletePostCheck @UserId, @ClassificationRoleID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ClassificationRoleId });
            return ErrorMessages;
        }

    }
}
