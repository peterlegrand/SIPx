
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
    public class ClassificationValueRoleProvider : IClassificationValueRoleProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValueRoleProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePostCheck @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return CheckString;
        }

        public async Task<string> CreatePost(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePost @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return String;
        }

        public Task<List<ClassificationValueRoleUpdateGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueRoleIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationId });
        }

        public Task<ClassificationValueRoleUpdateGet> UpdateGet(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleUpdateGet @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationValueRoleId });
        }

        public bool UpdatePost(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleUpdatePost @ClassificationValueRoleId, @RoleId, @ClassificationValueId, @ClassificationRelationTypeId, @ModifierId";
            _sqlDataAccess.SaveData<ClassificationValueRoleUpdateGet>(usp, ClassificationValueRole);
            return true;
        }
        public Task<ClassificationValueRoleDeleteGet> DeleteGet(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleDeleteGet @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleDeleteGet, dynamic>(usp, new { UserId, ClassificationValueRoleId });

        }
        public bool DeletePost(int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleDeletePost @ClassificationValueRoleId";
              _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationValueRoleId = ClassificationValueRoleId });
            return true;
        }

    }
}
