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
    public class ClassificationValueUserProvider : IClassificationValueUserProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValueUserProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(ClassificationValueUserCreateGet ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePostCheck @UserOfClassificationValueId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return CheckString;
        }

        public async Task<string> CreatePost(ClassificationValueUserCreateGet ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePost @UserOfClassificationValueId , @ClassificationValueId, @ClassificationRelationTypeId, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return String;
        }

        public Task<List<ClassificationValueUserIndexGet>> IndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueUserIndexGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadData<ClassificationValueUserIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }

        public Task<ClassificationValueUserUpdateGet> UpdateGet(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserUpdateGet @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationValueUserId });

        }

        public bool UpdatePost(ClassificationValueUserUpdateGet ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserUpdatePost @ClassificationValueUserId, @UserOfClassificationValueId, @ClassificationRelationTypeId, @UserId";
            _sqlDataAccess.SaveData<ClassificationValueUserUpdateGet>(usp, ClassificationValueUser);
            return true;
        }

        public Task<ClassificationValueUserDeleteGet> DeleteGet(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserDeleteGet @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserDeleteGet, dynamic>(usp, new { UserId, ClassificationValueUserId });

        }

        public bool DeletePost(int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserDeletePost @ClassificationValueUserId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationValueUserId = ClassificationValueUserId });
            return true;
        }

    }
}
