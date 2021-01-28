
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

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationLevelCreateGet ClassificationLevel)
        {
            string usp = "usp_ClassificationLevelCreatePostCheck @ClassificationId,@CodePrefix , @CodeSuffix , @CodeTypeId , @Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @UserID ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationLevel);
            return ErrorMessages;
        }

        public bool CreatePost(ClassificationLevelCreateGet ClassificationLevel)
        {
            string usp = "usp_classificationLevelCreatePost @ClassificationId,@CodePrefix , @CodeSuffix , @CodeTypeId , @Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelCreateGet>(usp, ClassificationLevel);
            return true;
        }

        public async Task<List<ClassificationLevelIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevelIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }

        public Task<ClassificationLevelUpdateGet> UpdateGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelUpdateGet @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelUpdateGet, dynamic>(usp, new { UserId, ClassificationLevelId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationLevelUpdateGet ClassificationLevel)
        {
            string usp = "usp_ClassificationLevelUpdatePostCheck @ClassificationLevelId, @CodePrefix , @CodeSuffix , @CodeTypeId ,@Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationLevel);
            return ErrorMessages;
        }
        public bool UpdatePost(ClassificationLevelUpdateGet ClassificationLevel)
        {
            string usp = "usp_classificationLevelUpdatePost @ClassificationLevelId,@CodePrefix , @CodeSuffix , @CodeTypeId , @Sequence, @DateLevelId, @OnTheFly, @Alphabetically, @CanLink, @InDropDown, @InMenu,  @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelUpdateGet>(usp, ClassificationLevel);
            return true;
        }

        public Task<ClassificationLevelDeleteGet> DeleteGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelDeleteGet @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelDeleteGet, dynamic>(usp, new { UserId, ClassificationLevelId });

        }

        public bool DeletePost(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelDeletePost @UserId, @ClassificationLevelID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ClassificationLevelId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelDeletePostCheck @UserId, @ClassificationLevelID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ClassificationLevelId });
            return ErrorMessages;
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
