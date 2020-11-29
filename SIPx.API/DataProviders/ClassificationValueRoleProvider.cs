
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

        public async Task<string> CreatePostCheck(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePostCheck @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, @UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return CheckString;
        }

        public async Task<string> CreatePost(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePost @RoleId, @ClassificationValueId, @ClassificationRelationTypeId, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return String;
        }

        public Task<List<ClassificationValueRoleIndexGet>> IndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueRoleIndexGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadData<ClassificationValueRoleIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
        }

        public Task<ClassificationValueRoleUpdateGet> UpdateGet(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleUpdateGet @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationValueRoleId });
        }

        public Task<ClassificationValueRoleCreateGetClassificationName> ClassificationValueRoleCreateGetClassificationName(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueRoleCreateGetClassificationName @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleCreateGetClassificationName, dynamic>(usp, new { UserId, ClassificationValueId });
        }

        public bool UpdatePost(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleUpdatePost @ClassificationValueRoleId, @RoleId, @ClassificationRelationTypeId, @UserId";
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
