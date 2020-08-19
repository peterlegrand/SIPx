
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
        public Task<List<ClassificationValueUserUpdateGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueUserIndex @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationValueUserUpdateGet> UpdateGet(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserUpdateGet @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationValueUserId });

        }
        public async Task<string> CreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePostCheck @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return CheckString;
        }
        public async Task<string> CreatePost(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePost @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return String;
        }
        public bool UpdatePost(ClassificationValueUserUpdateGet ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserUpdatePost @ClassificationValueUserId, @UserId, @ClassificationValueId, @ClassificationRelationTypeId, @ModifierId";
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
