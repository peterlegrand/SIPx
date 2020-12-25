
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class PageSectionContentConditionProvider : IPageSectionContentConditionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionContentConditionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PageSectionContentConditionCreateGet PageSectionContentCondition)
        {
            string usp = "usp_PageSectionCreateConditionPostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById, @LanguageId, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PageSectionContentCondition);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PageSectionContentConditionCreateGet PageSectionContentCondition)
        {
            string usp = "usp_PageSectionContentConditionCreatePost @PageSectionId, @PageSectionContentConditionTypeId, @PageSectionContentConditionInt, @PageSectionContentConditionString, @PageSectionContentConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionContentCondition);
            return CheckString;
        }

        public async Task<List<PageSectionContentConditionIndexGet>> IndexGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionContentConditionIndexGet @UserID, @PageSectionID";
            var x = await _sqlDataAccess.LoadData<PageSectionContentConditionIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionID = PageSectionId });
            return x;
        }
        public async Task<List<PageSectionContentConditionCreateGetClassifications>> CreateGetClassifications(string UserId)
        {
            string usp = "usp_PageSectionContentConditionCreateGetClassifications @UserID";
            var x = await _sqlDataAccess.LoadData<PageSectionContentConditionCreateGetClassifications, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ClassificationValueList>> CreateGetClassificationValues(string UserId, int ClassificationId)
        {
            string usp = "usp_PageSectionContentConditionCreateGetClassificationValues @UserID, @ClassificationId";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }

        public Task<PageSectionContentConditionUpdateGet> UpdateGet(string UserId, int PageSectionContentConditionId)
        {
            string usp = "usp_PageSectionContentConditionUpdateGet @UserId, @PageSectionContentConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionContentConditionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionContentConditionId = PageSectionContentConditionId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PageSectionContentConditionUpdateGet PageSectionContentCondition)
        {
            string usp = "usp_PageSectionUpdateConditionPostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById, @LanguageId, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PageSectionContentCondition);
            return ErrorMessages;
        }
        public bool UpdatePost(PageSectionContentConditionUpdateGet PageSectionContentCondition)
        {
            string usp = "usp_PageSectionContentConditionUpdatePost @PageSectionContentConditionId, @PageSectionContentConditionTypeId, @PageSectionContentConditionInt, @PageSectionContentConditionDate, @PageSectionContentConditionString, @Name, @Description, @MenuName , @MouseOver, @UserId ";
            _sqlDataAccess.SaveData<PageSectionContentConditionUpdateGet>(usp, PageSectionContentCondition);
            return true;
        }

        public async Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionLanguageIndexGet @UserId, @PageSectionID";
            var x = await _sqlDataAccess.LoadData<PageSectionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });
            return x;
        }

        public Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId)
        {
            string usp = "usp_PageSectionLanguageUpdateGet @UserId, @PageSectionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionLanguageId = PageSectionLanguageId });

        }

        public Task<PageSectionContentConditionDeleteGet> DeleteGet(string UserId, int PageSectionContentConditionId)
        {
            string usp = "usp_PageSectionContentConditionDeleteGet @UserId, @PageSectionContentConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionContentConditionDeleteGet, dynamic>(usp, new { UserId, PageSectionContentConditionId });

        }

        public bool DeletePost(string UserId, int PageSectionContentConditionId)
        {
            string usp = "usp_PageSectionContentConditionDeletePost @UserId, @PageSectionContentConditionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PageSectionContentConditionId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PageSectionContentConditionId)
        {
            string usp = "usp_PageSectionContentConditionDeletePostCheck @UserId, @PageSectionContentConditionID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PageSectionContentConditionId });
            return ErrorMessages;
        }

    }
}
