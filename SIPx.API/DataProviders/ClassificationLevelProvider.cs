
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

        public Task<List<SequenceList>> CreateGetSequence(string UserId, int ClassificationId)
        {
            string usp = "[usp_ClassificationLevelCreateGetSequence] @UserID, @ClassificationId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ClassificationId });
        }

        public async Task<string> CreatePostCheck(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_ClassificationLevelCreatePostCheck @ClassificationId  , @Sequence , @LanguageId , @Name, @DateLevelId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationLevel);
            return CheckString;
        }

        public bool CreatePost(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_classificationLevelCreatePost @ClassificationId, @Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelCreatePost>(usp, ClassificationLevel);
            return true;
        }

        public async Task<List<ClassificationLevelIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevelIndex @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }

        public Task<ClassificationLevelUpdateGet> UpdateGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelUpdateGet @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelUpdateGet, dynamic>(usp, new { UserId, ClassificationLevelId });

        }
        
        public bool UpdatePost(ClassificationLevelUpdateGet ClassificationLevel)
        {
            string usp = "usp_classificationLevelUpdatePost @ClassificationLevelId, @Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @ModifierID";
            _sqlDataAccess.SaveData<ClassificationLevelUpdateGet>(usp, ClassificationLevel);
            return true;
        }

        public async Task<List<ClassificationLevelLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelLanguageIndex @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelId });
            return x;
        }

        public Task<ClassificationLevelLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLevelLanguageId)
        {
            string usp = "usp_ClassificationLevelLanguageUpdateGet @UserId, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelLanguageId });

        }

    }
}
