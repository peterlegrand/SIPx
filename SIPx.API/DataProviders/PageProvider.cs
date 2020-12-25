
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
    public class PageProvider : IPageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PageCreateGet Page)
        {
            string usp = "usp_PageCreatePostCheck @LanguageID, @name, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Page);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PageCreateGet Page)
        {
            string usp = "usp_PageCreatePost @ShowTitleName , @ShowTitleDescription , @StatusId, @Name, @Description , @MenuName , @MouseOver , @TitleName , @TitleDescription , @UserId,@OrganizationId, @ProjectId,@ClassificationId, @SelectedUserId ";




            //            string usp = "usp_PageCreatePost @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<List<PageIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<PageIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<PageUpdateGet> UpdateGet(string UserId, int PageId)
        {
            string usp = "usp_PageUpdateGet @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<PageUpdateGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PageUpdateGet Page)
        {
            string usp = "usp_PageUpdatePostCheck @LanguageID, @name, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Page);
            return ErrorMessages;
        }
        public bool UpdatePost(PageUpdateGet Page)
        {
            string usp = "usp_PageUpdatePost @PageId " +
                ", @ShowTitleName " +
                ", @ShowTitleDescription " +
                ", @StatusId " +
                ", @Name " +
                ", @Description " +
                ", @MenuName " +
                ", @MouseOver " +
                ", @TitleName " +
                ", @TitleDescription " +
                ", @UserId " +
                ", @OrganizationId " +
                ", @ProjectId " +
                ", @ClassificationId " +
                ", @SelectedUserId ";

            _sqlDataAccess.SaveData<PageUpdateGet>(usp, Page);
            return true;
        }

        public Task<PageDeleteGet> DeleteGet(string UserId, int PageId)
        {
            string usp = "usp_PageDeleteGet @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<PageDeleteGet, dynamic>(usp, new { UserId, PageId });

        }

        public bool DeletePost(string UserId, int PageId)
        {
            string usp = "usp_PageDeletePost @UserId, @PageID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PageId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PageId)
        {
            string usp = "usp_PageDeletePostCheck @UserId, @PageID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PageId });
            return ErrorMessages;
        }

        public async Task<List<PageLanguageIndexGet>> LanguageIndexGet(string UserId, int PageId)
        {
            string usp = "usp_PageLanguageIndexGet @UserId, @PageID";
            var x = await _sqlDataAccess.LoadData<PageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }

        public Task<PageLanguageIndexGet> LanguageUpdateGet(string UserId, int PageLanguageId)
        {
            string usp = "usp_PageLanguageUpdateGet @UserId, @PageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageLanguageId = PageLanguageId });

        }

        public Task<List<PageList>> ListForMenuTemplate(string UserId)
        {
            string usp = "usp_PageListForMenuTemplate @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }

        public Task<List<PageList>> ListForMenu(string UserId)
        {
            string usp = "usp_PageListForMenu @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
