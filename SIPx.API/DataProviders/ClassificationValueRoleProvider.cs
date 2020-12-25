
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

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePostCheck @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationValueRole);
            return ErrorMessages;
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

        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleUpdatePostCheck @ClassificationValueRoleId, @RoleId, @ClassificationRelationTypeId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationValueRole);
            return ErrorMessages;
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

        public bool DeletePost(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleDeletePost @UserId, @ClassificationValueRoleID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationValueRoleId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleDeletePostCheck @UserId, @ClassificationValueRoleID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ClassificationValueRoleId });
            return ErrorMessages;
        }

    }
}
