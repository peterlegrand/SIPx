
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
    public class PageSectionConditionProvider : IPageSectionConditionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionConditionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(PageSectionConditionCreateGet PageSectionCondition)
        {
            string usp = "usp_PageSectionCreateConditionPostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionCondition);
            return CheckString;
        }

        public async Task<string> CreatePost(PageSectionConditionCreateGet PageSectionCondition)
        {
            string usp = "usp_PageSectionCreatePost @PageSectionId, @PageSectionConditionTypeId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSectionCondition);
            return CheckString;
        }

        public async Task<List<PageSectionConditionIndexGet>> IndexGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionConditionIndexGet @UserID, @PageSectionID";
            var x = await _sqlDataAccess.LoadData<PageSectionConditionIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionID = PageSectionId });
            return x;
        }

        public Task<PageSectionConditionUpdateGet> UpdateGet(string UserId, int PageSectionConditionId)
        {
            string usp = "usp_PageSectionUpdateGet @UserId, @PageSectionConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionConditionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionConditionId = PageSectionConditionId });

        }

        public bool UpdatePost(PageSectionConditionUpdateGet PageSectionCondition)
        {
            string usp = "usp_PageSectionConditionUpdatePost @PageSectionId, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @SizeX, @SizeY, @DashboardRow, @DashboardColumn, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @Name, @Description, @MenuName , @MouseOver, @TitleName, @TitleDescription , @ModifierId ";
            _sqlDataAccess.SaveData<PageSectionConditionUpdateGet>(usp, PageSectionCondition);
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

        public Task<PageSectionConditionDeleteGet> DeleteGet(string UserId, int PageSectionConditionId)
        {
            string usp = "usp_PageSectionConditionDeleteGet @UserId, @PageSectionConditionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionConditionDeleteGet, dynamic>(usp, new { UserId, PageSectionConditionId });

        }

        public bool DeletePost(int PageSectionConditionId)
        {
            string usp = "usp_PageSectionConditionDeletePost @PageSectionConditionId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PageSectionConditionId = PageSectionConditionId });
            return true;
        }

    }
}
