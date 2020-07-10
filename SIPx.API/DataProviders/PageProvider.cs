
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

        public async Task<List<PageSectionTypeList>> GetPageSectionTypes(string UserId, int PageId)
        {
            string usp = "usp_PageAddresses @UserId, @PageID";
            var x = await _sqlDataAccess.LoadData<PageAddress, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }
        public Task<PageAddress> GetPageAddress(string UserId, int PageAddressId)
        {
            string usp = "usp_PageAddress @UserId, @PageAddressID";
            return _sqlDataAccess.LoadSingleRecord<PageAddress, dynamic>(usp, new { UserId = UserId, PageAddressId = PageAddressId });

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
        public Task<List<PageTelecom>> GetPageTelecoms(string UserId, int PageId)
        {
            string usp = "usp_PageTelecoms @UserId, @PageID";
            return _sqlDataAccess.LoadData<PageTelecom, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
        public Task<PageTelecom> GetPageTelecom(string UserId, int PageTelecomId)
        {
            string usp = "usp_PageTelecom @UserId, @PageTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PageTelecom, dynamic>(usp, new { UserId = UserId, PageTelecomId = PageTelecomId });

        }
        public Task<List<PageTypeLanguage>> GetPageTypeLanguages(string UserId, int PageTypeId)
        {
            string usp = "usp_PageTypeLanguages @UserId, @PageTypeID";
            return _sqlDataAccess.LoadData<PageTypeLanguage, dynamic>(usp, new { UserId = UserId, PageTypeId = PageTypeId });

        }
        public Task<PageTypeLanguage> GetPageTypeLanguage(string UserId, int PageTypeLanguageId)
        {
            string usp = "usp_PageTypeLanguage @UserId, @PageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageTypeLanguage, dynamic>(usp, new { UserId = UserId, PageTypeLanguageId = PageTypeLanguageId });

        }
        public Task<List<PageType>> GetPageTypes(string UserId)
        {
            string usp = "usp_PageTypes @UserID";
            return _sqlDataAccess.LoadData<PageType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PageType> GetPageType(string UserId, int PageTypeId)
        {
            string usp = "usp_PageType @UserId, @PageTypeID";
            return _sqlDataAccess.LoadSingleRecord<PageType, dynamic>(usp, new { UserId = UserId, PageTypeId = PageTypeId });

        }
    }
}
