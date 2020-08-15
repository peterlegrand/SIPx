
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
    public class UserPageProvider : IUserPageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserPageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public async Task<List<PageIndexGet>> UserPageIndexGet(string UserId)
        {
            string usp = "usp_UserPageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<PageIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<PageUpdateGet> UserPageUpdateGet(string UserId, int PageId)
        {
            string usp = "usp_UserPageUpdateGet @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<PageUpdateGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
        public async Task<List<PageSectionIndexGet>> UserPageSectionIndexGet(string UserId, int PageId)
        {
            string usp = "usp_UserPageSectionIndexGet @UserID, @PageID";
            var x = await _sqlDataAccess.LoadData<PageSectionIndexGet, dynamic>(usp, new { UserId = UserId, PageID = PageId });
            return x;
        }
        public Task<PageSectionUpdateGet> UserPageSectionUpdateGet(string UserId, int PageSectionId)
        {
            string usp = "usp_UserPageSectionUpdateGet @UserId, @PageSectionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });

        }
        public Task<List<PageList>> UserPageListForMenuTemplate(string UserId)
        {
            string usp = "usp_UserPageListForMenuTemplate @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<PageList>> UserPageListForMenu(string UserId)
        {
            string usp = "usp_UserPageListForMenu @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<string> UserPageUpdatePostCheck(PageUpdateGet Page)
        {
            string usp = "usp_UserPageUpdatePostCheck @name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }
        public async Task<string> UserPageCreatePostCheck(PageCreatePost Page)
        {
            string usp = "usp_UserPageCreatePostCheck @LanguageID, @name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<string> UserPageCreatePost(PageCreatePost Page)
        {
            string usp = "usp_UserPageCreatePost @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }
        public async Task<string> UserPageUpdatePost(PageUpdateGet Page)
        {
            string usp = "usp_UserPageUpdatePost @PageID, @StatusId, @ShowTitleName, @ShowTitleDescription, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @ModifierID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }
        public async Task<string> UserPageSectionCreatePostCheck(PageSectionCreatePost PageSection)
        {
            string usp = "usp_UserPageSectionCreatePostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById,, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }

        public async Task<string> UserPageSectionCreatePost(PageSectionCreatePost PageSection)
        {
            string usp = "usp_UserPageSectionCreatePost @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @OneTwoColumns, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }
        public Task<List<SequenceList>> UserPageSectionCreateGetSequence(string UserId, int PageId)
        {
            string usp = "usp_UserPageSectionCreateGetSequence @UserID, @PageId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, PageId });
        }
    }
}
