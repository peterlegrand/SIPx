
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
    public class ClassificationLevelProvider : IClassificationLevelProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationLevelProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId)
        {
            string usp = "usp_ClassificationIndexGet @UserID";
            List<ClassificationIndexGet> x = await _sqlDataAccess.LoadData<ClassificationIndexGet, dynamic>(usp, new { UserId });
            return x;
        }
        //public async Task<List<ClassificationCreateGet>> ClassificationCreateGet(string UserId)
        //{
        //    string usp = "usp_Classifications @UserID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationIndexGet, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}
        public async Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId)
        {
            string usp = "usp_ClassificationCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<ClassificationCreateGetSequence, dynamic>(usp, new { UserId });
            return x;
        }
        //public Task<ClassificationUpdateGet> ClassificationUpdateGet(string UserId, int ClassificationId)
        //{
        //    string usp = "usp_ClassificationUpdateGet @UserId, @classificationID";
        //    return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        //}

        public async Task<List<ClassificationLevelIndexGet>> ClassificationLevelIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevelIndex @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }
        public Task<ClassificationLevelUpdateGet> ClassificationLevelUpdateGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelUpdateGet @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelUpdateGet, dynamic>(usp, new { UserId, ClassificationLevelId });

        }
        public async Task<List<ClassificationLevelLanguageIndexGet>> ClassificationLevelLanguageIndexGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelLanguageIndex @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelId });
            return x;
        }
        public Task<ClassificationLevelLanguageIndexGet> ClassificationLevelLanguageUpdateGet(string UserId, int ClassificationLevelLanguageId)
        {
            string usp = "usp_ClassificationLevelLanguageUpdateGet @UserId, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelLanguageId });

        }
        public bool ClassificationLevelCreatePost(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_classificationLevelCreatePost @ClassificationId, @Sequence, @DateLevelId, @OnTheFly, @Alhpabetically, @CanLink, @InDropDown, @InMenu,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelCreatePost>(usp, ClassificationLevel);
            return true;
        }
        public Task<List<SequenceList>> ClassificationLevelCreateGetSequence(string UserId, int ClassificationId)
        {
            string usp = "[usp_ClassificationLevelCreateGetSequence] @UserID, @ClassificationId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ClassificationId });
        }
        public async Task<string> ClassificationLevelCreatePostCheck(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_ClassificationLevelCreatePostCheck @ClassificationId  , @Sequence , @LanguageId , @Name, @DateLevelId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationLevel);
            return CheckString;
        }
    }
}
