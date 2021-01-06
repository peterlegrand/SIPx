
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
            string usp = "usp_ClassificationLevelPropertyCreatePost @ClassificationLevelId, @PropertyId, @PropertyStatusId, @UserID";
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
            string usp = "usp_classificationLevelPropertyUpdatePostCheck @UserId, @ClassificationLevelPropertyId, @PropertyStatusId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationLevelProperty);
            return ErrorMessages;
        }
        public bool UpdatePost(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            string usp = "usp_classificationLevelPropertyUpdatePost @UserId, @ClassificationLevelPropertyId, @PropertyStatusId";
            _sqlDataAccess.SaveData<ClassificationLevelPropertyUpdateGet>(usp, ClassificationLevelProperty);
            return true;
        }

        public Task<ClassificationLevelPropertyDeleteGet> DeleteGet(string UserId, int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyDeleteGet @UserId, @ClassificationLevelPropertyID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelPropertyDeleteGet, dynamic>(usp, new { UserId, ClassificationLevelPropertyId });

        }

        public bool DeletePost(string UserId, int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyDeletePost @UserId, @ClassificationLevelPropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationLevelPropertyId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationLevelPropertyId)
        {
            string usp = "usp_ClassificationLevelPropertyDeletePostCheck @UserId, @ClassificationLevelPropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationLevelPropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ClassificationLevelPropertyId });
            return ErrorMessages;
        }



    }
}
