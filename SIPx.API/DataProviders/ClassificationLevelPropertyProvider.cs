
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
    public class ClassificationLevelPropertyProvider : IClassificationLevelPropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationLevelPropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<ClassificationLevelPropertyCreateGet> CreateGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelPropertyCreateGet @UserID, @ClassificationLevelId";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelPropertyCreateGet, dynamic>(usp, new { UserId, ClassificationLevelId });
        }
        public async Task<List<PropertyList>> CreateGetPropertyList(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelPropertyCreateGetPropertyList @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<PropertyList, dynamic>(usp, new { UserId, ClassificationLevelId });
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationLevelPropertyCreateGet ClassificationLevelProperty)
        {
            string usp = "usp_ClassificationLevelPropertyCreatePostCheck @ClassificationId  , @Sequence , @LanguageId , @Name, @DateLevelPropertyId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationLevelProperty);
            return ErrorMessages;
        }

        public bool CreatePost(ClassificationLevelPropertyCreateGet ClassificationLevelProperty)
        {
            string usp = "usp_ClassificationLevelPropertyCreatePost @ClassificationLevelId, @PropertyId, @ClassificationLevelPropertyStatusId, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelPropertyCreateGet>(usp, ClassificationLevelProperty);
            return true;
        }

        public async Task<List<ClassificationLevelPropertyIndexGet>> IndexGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelPropertyIndexGet @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelPropertyIndexGet, dynamic>(usp, new { UserId, ClassificationLevelId });
            return x;
        }

        public Task<ClassificationLevelPropertyUpdateGet> UpdateGet(string UserId, int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyUpdateGet @UserId, @ClassificationLevelPropertyID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelPropertyUpdateGet, dynamic>(usp, new { UserId, ClassificationLevelPropertyId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            string usp = "usp_classificationLevelPropertyUpdatePostCheck @UserId, @ClassificationLevelPropertyId, @ClassificationLevelPropertyStatusId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationLevelProperty);
            return ErrorMessages;
        }
        public bool UpdatePost(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            string usp = "usp_classificationLevelPropertyUpdatePost @UserId, @ClassificationLevelPropertyId, @ClassificationLevelPropertyStatusId";
            _sqlDataAccess.SaveData<ClassificationLevelPropertyUpdateGet>(usp, ClassificationLevelProperty);
            return true;
        }

        public Task<ClassificationLevelPropertyDeleteGet> DeleteGet(string UserId, int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyDeleteGet @UserId, @ClassificationLevelPropertyID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelPropertyDeleteGet, dynamic>(usp, new { UserId, ClassificationLevelPropertyId });

        }

        public bool DeletePost(int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyDeletePost @ClassificationLevelPropertyId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationLevelPropertyId = ClassificationLevelPropertyId });
            return true;
        }

        //public async Task<List<ClassificationLevelPropertyLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationLevelPropertyId)
        //{
        //    string usp = "usp_ClassificationLevelPropertyLanguageIndex @UserId, @ClassificationLevelPropertyID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationLevelPropertyLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelPropertyId });
        //    return x;
        //}

        //public Task<ClassificationLevelPropertyLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLevelPropertyLanguageId)
        //{
        //    string usp = "usp_ClassificationLevelPropertyLanguageUpdateGet @UserId, @ClassificationLevelPropertyLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<ClassificationLevelPropertyLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelPropertyLanguageId });

        //}

    }
}
