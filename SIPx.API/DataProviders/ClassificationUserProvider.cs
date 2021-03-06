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
    public class ClassificationUserProvider : IClassificationUserProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationUserProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationUserCreateGet ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePostCheck @UserOfClassificationId, @ClassificationId , @ClassificationRelationTypeId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationUser);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ClassificationUserCreateGet ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePost @UserOfClassificationId, @ClassificationId , @ClassificationRelationTypeId, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationUser);
            return String;
        }

        public Task<List<ClassificationUserIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUserIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationUserIndexGet, dynamic>(usp, new { UserId, ClassificationId });

        }

        public Task<ClassificationUserUpdateGet> UpdateGet(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserUpdateGet @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUserUpdateGet, dynamic>(usp, new { UserId, ClassificationUserId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationUserUpdateGet ClassificationUser)
        {
            string usp = "usp_ClassificationUserUpdatePostCheck @ClassificationUserId, @UserOfClassificationId , @ClassificationRelationTypeId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationUser);
            return ErrorMessages;
        }

        public bool UpdatePost(ClassificationUserUpdateGet ClassificationUser)
        {
            string usp = "usp_ClassificationUserUpdatePost @ClassificationUserId, @UserOfClassificationId , @ClassificationRelationTypeId, @UserId";
            _sqlDataAccess.SaveData<ClassificationUserUpdateGet>(usp, ClassificationUser);
            return true;
        }

        public Task<ClassificationUserDeleteGet> DeleteGet(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserDeleteGet @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUserDeleteGet, dynamic>(usp, new { UserId, ClassificationUserId });

        }

        public bool DeletePost(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserDeletePost @UserId, @ClassificationUserID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationUserId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserDeletePostCheck @UserId, @ClassificationUserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ClassificationUserId });
            return ErrorMessages;
        }

    }
}
