
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

        public async Task<string> CreatePostCheck(ClassificationRoleCreatePost ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePostCheck @RoleId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationRole);
            return CheckString;
        }

        public bool CreatePost(ClassificationRoleCreatePost ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePost @RoleId, @ClassificationId, @ClassificationRelationTypeId, @UserID";
            _sqlDataAccess.SaveData<ClassificationRoleCreatePost>(usp, ClassificationRole);
            return true;
        }
        public Task<ClassificationRoleDeleteGet> DeleteGet(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleDeleteGet @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRoleDeleteGet, dynamic>(usp, new { UserId, ClassificationRoleId });

        }
        public bool DeletePost(int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleDeletePost @ClassificationRoleId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationRoleId = ClassificationRoleId });
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

        public bool UpdatePost(ClassificationRoleUpdateGet ClassificationRole)
        {
            string usp = "usp_ClassificationRoleUpdatePost @RoleId, @ClassificationId, @ClassificationRelationTypeId, @UserID";
            _sqlDataAccess.SaveData<ClassificationRoleUpdateGet>(usp, ClassificationRole);
            return true;
        }

    }
}
