
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


        public async Task<List<PageLanguage>> GetPageLanguages(string UserId, int PageId)
        {
            string usp = "usp_DateLevels @UserId, @PageID";
            var x = await _sqlDataAccess.LoadData<PageLanguage, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }
        public Task<PageLanguage> GetPageLanguage(string UserId, int PageLanguageId)
        {
            string usp = "usp_DateLevel @UserId, @DPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageLanguage, dynamic>(usp, new { UserId = UserId, PageLanguageId = PageLanguageId });

        }
        public async Task<List<Page>> GetPages(string UserId)
        {
            string usp = "usp_Pages @UserID";
            var x = await _sqlDataAccess.LoadData<Page, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Page> GetPage(string UserId, int PageId)
        {
            string usp = "usp_Page @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<Page, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
        public Task<List<PageSectionDataTypeList>> GetPageSectionDataTypeList(string UserId)
        {
            string usp = "usp_PageSectionDataTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionDataTypeList, dynamic>(usp, new { UserId = UserId});

        }
        public Task<List<PageSectionTypeList>> GetPageSectionTypeList(string UserId)
        {
            string usp = "usp_PageSectionTypeList @UserId, @PageID";
            return _sqlDataAccess.LoadData<PageSectionTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
