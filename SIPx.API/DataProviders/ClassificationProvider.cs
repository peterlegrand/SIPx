
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
    public class ClassificationProvider : IClassificationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ClassificationCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationCreateGet Classification)
        {
            string usp = "usp_ClassificationCreatePostCheck @StatusId  , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessage = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Classification);
            return ErrorMessage;
        }

        public bool CreatePost(ClassificationCreateGet Classification)
        {
            string usp = "usp_classificationCreatePost @StatusId, @HasDropDown, @DropDownSequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver,@IconId, @Color, @UserID";
            _sqlDataAccess.SaveData<ClassificationCreateGet>(usp, Classification);
            return true;
        }

        public async Task<List<ClassificationIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ClassificationIndexGet @UserID";
            List<ClassificationIndexGet> x = await _sqlDataAccess.LoadData<ClassificationIndexGet, dynamic>(usp, new { UserId });
            return x;
        }

        public Task<ClassificationUpdateGet> UpdateGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUpdateGet @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }

        public async Task<string> UpdatePostCheck(ClassificationUpdateGet Classification)
        {
            string usp = "usp_ClassificationUpdatePostCheck @classificationLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }

        public bool UpdatePost(ClassificationUpdateGet Classification)
        {
            string usp = "usp_ClassificationUpdatePost @classificationId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver ,@Color, @IconId, @CreatorId ";
            _sqlDataAccess.SaveData<ClassificationUpdateGet>(usp, Classification);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.

        public Task<ClassificationDeleteGet> DeleteGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationDeleteGet @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationDeleteGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public bool DeletePost(int classificationId)
        {
            string usp = "usp_ClassificationDeletePost @ClassificationId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationId = classificationId });
            return true;
        }

        public Task<List<LanguageList>> LangugageCreateGetLanguageList(string UserId, int ClassificationId)
        {
            string usp = "[usp_ClassificationLangugageCreateGetLanguageList] @UserID, @ClassificationId";
            return _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId, ClassificationId });
        }

        public async Task<List<ClassificationLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLanguageIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }

        public Task<ClassificationLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLanguageId)
        {
            string usp = "usp_ClassificationLanguageUpdateGet @UserId, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLanguageId });

        }
        public async Task<List<ClassificationList>> List(string UserId)
        {
            string usp = "usp_ClassificationList @UserID";
            var x = await _sqlDataAccess.LoadData<ClassificationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ContentAdvancedSearchPostClassification>> ClassificationsWithValues(string UserId)
        {
            string usp = "usp_ClassificationsWithValues @UserID";
            var x = await _sqlDataAccess.LoadData<ContentAdvancedSearchPostClassification, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
