
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
    public class PageSectionProvider : IPageSectionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId)
        {
            string usp = "usp_PageSectionCreateGetSequence @UserID, @PageId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, PageId });
        }

        public async Task<string> CreatePostCheck(PageSectionCreatePost PageSection)
        {
            string usp = "usp_PageSectionCreatePostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }

        public async Task<string> CreatePost(PageSectionCreatePost PageSection)
        {
            string usp = "usp_PageSectionCreatePost @PageId, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName , @ShowSectionTitleDescription , @ShowContentTypeTitleName , @ShowContentTypeTitleDescription , @SizeX, @SizeY, @DashboardRow, @DashboardColumn, @ContentTypeId, @SortById, @MaxContent, @HasPaging , @LanguageId, @Name , @Description , @MenuName 	, @MouseOver 	, @TitleName 	, @TitleDescription , @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }

        public async Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId)
        {
            string usp = "usp_PageSectionIndexGet @UserID, @PageID";
            var x = await _sqlDataAccess.LoadData<PageSectionIndexGet, dynamic>(usp, new { UserId = UserId, PageID = PageId });
            return x;
        }

        public Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionUpdateGet @UserId, @PageSectionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });

        }

        public bool UpdatePost(PageSectionUpdateGet PageSection)
        {
            string usp = "usp_PageSectionUpdatePost @PageSectionId, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @SizeX, @SizeY, @DashboardRow, @DashboardColumn, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @Name, @Description, @MenuName , @MouseOver, @TitleName, @TitleDescription , @ModifierId ";
            _sqlDataAccess.SaveData<PageSectionUpdateGet>(usp, PageSection);
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

        public Task<PageSectionDeleteGet> DeleteGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionDeleteGet @UserId, @PageSectionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionDeleteGet, dynamic>(usp, new { UserId, PageSectionId });

        }

        public bool DeletePost(int PageSectionId)
        {
            string usp = "usp_PageSectionDeletePost @PageSectionId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PageSectionId = PageSectionId });
            return true;
        }

    }
}
