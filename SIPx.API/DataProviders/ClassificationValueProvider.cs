
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
    public class ClassificationValueProvider : IClassificationValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<ClassificationValueLanguageIndexGet>> ClassificationValueLanguageIndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueLanguageIndex @UserId, @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
            return x;
        }
        public Task<ClassificationValueLanguageIndexGet> ClassificationValueLanguageUpdateGet(string UserId, int ClassificationValueLanguageId)
        {
            string usp = "usp_ClassificationValueLanguageUpdateGet @UserId, @ClassificationValueLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueLanguageId });

        }
        public Task<List<ClassificationValueRoleUpdateGet>> ClassificationValueRoleIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueRoleIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationValueRoleUpdateGet> ClassificationValueRoleUpdateGet(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleUpdateGet @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationValueRoleId });

        }
        public Task<List<ClassificationValueUserUpdateGet>> ClassificationValueUserIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueUserIndex @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationValueUserUpdateGet> ClassificationValueUserUpdateGet(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserUpdateGet @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationValueUserId });

        }
        public Task<ClassificationValueUpdateGet> ClassificationValueUpdateGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueUpdateGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }
        public Task<List<ClassificationValueUpdateGet>> ClassificationValueIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public async Task<string> ClassificationValueCreatePostCheck(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePostCheck @ClassificationId, @ParentId, @LanguageId , @Name, @CreatorID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return CheckString;
        }
        public async Task<string> ClassificationValueCreatePost(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePost @ClassificationId, @ParentId, @DateFrom, @DateTo, @Location, @LanguageId, @Name, @Description, @DropDownName, @MenuName, @MouseOver, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return String;
        }
        public async Task<string> ClassificationValueRoleCreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePostCheck @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return CheckString;
        }
        public async Task<string> ClassificationValueRoleCreatePost(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePost @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return String;
        }
        public async Task<string> ClassificationValueUserCreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePostCheck @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return CheckString;
        }
        public async Task<string> ClassificationValueUserCreatePost(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePost @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return String;
        }
    }
}
