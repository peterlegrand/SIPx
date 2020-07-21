
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


        public async Task<List<PageLanguageIndexGet>> PageLanguageIndexGet(string UserId, int PageId)
        {
            string usp = "usp_PageLanguageIndexGet @UserId, @PageID";
            var x = await _sqlDataAccess.LoadData<PageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }
        public Task<PageLanguageIndexGet> PageLanguageUpdateGet(string UserId, int PageLanguageId)
        {
            string usp = "usp_PageLanguageUpdateGet @UserId, @PageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageLanguageId = PageLanguageId });

        }
        public async Task<List<PageIndexGet>> PageIndexGet(string UserId)
        {
            string usp = "usp_PageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<PageIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<PageUpdateGet> PageUpdateGet(string UserId, int PageId)
        {
            string usp = "usp_PageUpdateGet @UserId, @PageID";
            return _sqlDataAccess.LoadSingleRecord<PageUpdateGet, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
        public async Task<List<PageSectionIndexGet>> PageSectionIndexGet(string UserId, int PageId)
        {
            string usp = "usp_PageSectionIndexGet @UserID, @PageID";
            var x = await _sqlDataAccess.LoadData<PageSectionIndexGet, dynamic>(usp, new { UserId = UserId, PageID = PageId });
            return x;
        }
        public Task<PageSectionUpdateGet> PageSectionUpdateGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionUpdateGet @UserId, @PageSectionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });

        }
        public Task<List<PageSectionDataTypeList>> PageSectionDataTypeList(string UserId)
        {
            string usp = "usp_PageSectionDataTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionDataTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<PageSectionTypeList>> PageSectionTypeList(string UserId)
        {
            string usp = "usp_PageSectionTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<List<PageSectionLanguageIndexGet>> PageSectionLanguageIndexGet(string UserId, int PageSectionId)
        {
            string usp = "usp_PageSectionLanguageIndexGet @UserId, @PageSectionID";
            var x = await _sqlDataAccess.LoadData<PageSectionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });
            return x;
        }
        public Task<PageSectionLanguageIndexGet> PageSectionLanguageUpdateGet(string UserId, int PageLanguageId)
        {
            string usp = "usp_PageLanguageUpdateGet @UserId, @PageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PageLanguageId = PageLanguageId });

        }
    }
}
