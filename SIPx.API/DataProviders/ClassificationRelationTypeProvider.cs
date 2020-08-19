
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
    public class ClassificationRelationTypeProvider : IClassificationRelationTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationRelationTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<string> CreatePostCheck(ClassificationRelationTypeCreatePost ClassificationRelationType)
        {
            string usp = "usp_ClassificationRelationTypeCreatePostCheck @LanguageId , @Name";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationRelationType);
            return CheckString;
        }

        public bool CreatePost(ClassificationRelationTypeCreatePost ClassificationRelationType)
        {
            string usp = "usp_ClassificationRelationTypeCreatePost @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationRelationTypeCreatePost>(usp, ClassificationRelationType);
            return true;
        }

        public Task<List<ClassificationRelationTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeIndexGet, dynamic>(usp, new { UserId });

        }

        public Task<ClassificationRelationTypeUpdateGet> UpdateGet(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeUpdateGet @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeUpdateGet, dynamic>(usp, new { UserId, ClassificationRelationTypeId });

        }

        public bool UpdatePost(ClassificationRelationTypeUpdateGet ClassificationRelationType)
        {
            string usp = "usp_ClassificationRelationTypeUpdatePost @ClassificationRelationTypeId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationRelationTypeUpdateGet>(usp, ClassificationRelationType);
            return true;
        }
        public Task<ClassificationRelationTypeDeleteGet> DeleteGet(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeDeleteGet @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeDeleteGet, dynamic>(usp, new { UserId, ClassificationRelationTypeId });

        }
        public bool DeletePost(int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeDeletePost @ClassificationRelationTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationRelationTypeId = ClassificationRelationTypeId });
            return true;
        }

        public Task<List<ClassificationRelationTypeLanguageUpdateGet>> LanguageIndexGet(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeLanguageIndexGet @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeLanguageUpdateGet, dynamic>(usp, new { UserId, ClassificationRelationTypeId });

        }

        public Task<ClassificationRelationTypeLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId)
        {
            string usp = "usp_ClassificationRelationTypeLanguageUpdateGet @UserId, @ClassificationRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationRelationTypeLanguageId });

        }

        public Task<List<ClassificationRelationTypeList>> List(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeList, dynamic>(usp, new { UserId });
        }

        public Task<List<ClassificationRelationTypeList>> ListGet(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
