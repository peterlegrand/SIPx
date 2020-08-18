
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
        public bool UpdatePost(PageUpdateGet Page)
        {
            string usp = "usp_PageUpdatePost @PageId, @PageGroupId  , @ProcessTemplateId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<PageUpdateGet>(usp, Page);
            return true;
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
        public async Task<string> CreatePostCheck(PageCreatePost Page)
        {
            string usp = "usp_PageCreatePostCheck @LanguageID, @name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<string> CreatePost(PageCreatePost Page)
        {
            string usp = "usp_PageCreatePost @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }
    }
}
