
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
    public class PageSectionProcessConditionProvider : IPageSectionProcessConditionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionProcessConditionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            string usp = "usp_PageSectionCreateConditionPostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @OneTwoColumns, @ProcessTypeId, @SortById, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionProcessCondition);
            return CheckString;
        }

        public async Task<string> CreatePost(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            string usp = "usp_PageSectionProcessConditionCreatePost @PageSectionId, @PageSectionProcessConditionTypeId, @PageSectionProcessConditionInt, @PageSectionProcessConditionString, @PageSectionProcessConditionDate, @PageSectionProcessConditionBit, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionProcessCondition);
            return CheckString;
        }

        public async Task<List<PageSectionProcessConditionIndexGet>> IndexGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionProcessConditionIndexGet @UserID, @PageSectionID";
            var x = await _sqlDataAccess.LoadData<PageSectionProcessConditionIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionID = PageSectionId });
            return x;
        }
        public async Task<List<PageSectionProcessConditionCreateGetClassifications>> CreateGetClassifications(string UserId)
        {
            string usp = "usp_PageSectionContentConditionCreateGetClassifications @UserID";
            var x = await _sqlDataAccess.LoadData<PageSectionProcessConditionCreateGetClassifications, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ClassificationValueList>> CreateGetClassificationValues(string UserId, int ClassificationId)
        {
            string usp = "usp_PageSectionContentConditionCreateGetClassificationValues @UserID, @ClassificationId";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }

        public Task<PageSectionProcessConditionUpdateGet> UpdateGet(string UserId, int PageSectionProcessConditionId)
        {
            string usp = "usp_PageSectionProcessConditionUpdateGet @UserId, @PageSectionProcessConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionProcessConditionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionProcessConditionId = PageSectionProcessConditionId });

        }

        public async Task<string> UpdatePostCheck(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            string usp = "usp_PageSectionProcessConditionUpdatePostCheck @PageSectionProcessConditionId, @PageSectionProcessConditionTypeId, @PageSectionProcessConditionInt, @PageSectionProcessConditionDate, @PageSectionProcessConditionString, @Name, @Description, @MenuName , @MouseOver, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionProcessCondition);
            return CheckString;
        }

        public bool UpdatePost(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            string usp = "usp_PageSectionProcessConditionUpdatePost @PageSectionProcessConditionId, @PageSectionProcessConditionTypeId, @PageSectionProcessConditionInt, @PageSectionProcessConditionDate, @PageSectionProcessConditionString, @Name, @Description, @MenuName , @MouseOver, @UserId ";
            _sqlDataAccess.SaveData<PageSectionProcessConditionUpdateGet>(usp, PageSectionProcessCondition);
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

        public Task<PageSectionProcessConditionDeleteGet> DeleteGet(string UserId, int PageSectionProcessConditionId)
        {
            string usp = "usp_PageSectionProcessConditionDeleteGet @UserId, @PageSectionProcessConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionProcessConditionDeleteGet, dynamic>(usp, new { UserId, PageSectionProcessConditionId });

        }

        public bool DeletePost(int PageSectionProcessConditionId)
        {
            string usp = "usp_PageSectionProcessConditionDeletePost @PageSectionProcessConditionId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PageSectionProcessConditionId = PageSectionProcessConditionId });
            return true;
        }

    }
}
