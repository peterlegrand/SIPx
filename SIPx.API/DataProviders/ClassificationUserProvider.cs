
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

        public async Task<string> CreatePostCheck(ClassificationUserCreatePost ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePostCheck @UserId, @ClassificationId , @ClassificationRelationTypeId, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationUser);
            return CheckString;
        }

        public async Task<string> CreatePost(ClassificationUserCreatePost ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePost @UserId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
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

        public bool UpdatePost(ClassificationUserUpdateGet ClassificationUser)
        {
            string usp = "usp_ClassificationUserUpdatePost @UserId, @ClassificationId, @ClassificationRelationTypeId, @ModifierID";
            _sqlDataAccess.SaveData<ClassificationUserUpdateGet>(usp, ClassificationUser);
            return true;
        }
        public Task<ClassificationUserDeleteGet> DeleteGet(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserDeleteGet @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUserDeleteGet, dynamic>(usp, new { UserId, ClassificationUserId });

        }
        public bool DeletePost(int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserDeletePost @ClassificationUserId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationUserId = ClassificationUserId });
            return true;
        }

    }
}
