
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

        public async Task<string> CreatePostCheck(PageCreatePost Page)
        {
            string usp = "usp_UserPageCreatePostCheck @LanguageID, @name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<string> CreatePost(PageCreateGet Page)
        {
            string usp = "usp_UserPageCreatePost @ShowTitleName , @ShowTitleDescription , @CreatorId , @Name , @Description , @MenuName , @MouseOver , @TitleName , @TitleDescription ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<List<PageIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_UserPageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<PageIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<PageUpdateGet> UpdateGet(string UserId, int PageId)
        {
            string usp = "usp_UserPageUpdateGet @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<PageUpdateGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }

        public async Task<string> UpdatePostCheck(PageUpdateGet Page)
        {
            string usp = "usp_UserPageUpdatePostCheck @name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<string> UpdatePost(PageUpdateGet Page)
        {
            string usp = "usp_UserPageUpdatePost @PageID, @StatusId, @ShowTitleName, @ShowTitleDescription, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @ModifierID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Page);
            return CheckString;
        }

        public async Task<PageDeleteGet> DeleteGet(string UserId, int PageId)
        {
            string usp = "usp_UserPageDeleteGet @UserID, @PageId";
            var x = await _sqlDataAccess.LoadSingleRecord<PageDeleteGet, dynamic>(usp, new { UserId = UserId, PageId });
            return x;
        }

        public bool DeletePost(PageDeleteGet Page)
        {
            string usp = "usp_UserPageDeletePost @UserId, @PageID";
            _sqlDataAccess.SaveData<PageDeleteGet>(usp, Page);
            return true;
        }

        public Task<List<PageList>> ListForMenuTemplate(string UserId)
        {
            string usp = "usp_UserPageListForMenuTemplate @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }

        public Task<List<PageList>> ListForMenu(string UserId)
        {
            string usp = "usp_UserPageListForMenu @UserId";
            return _sqlDataAccess.LoadData<PageList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
