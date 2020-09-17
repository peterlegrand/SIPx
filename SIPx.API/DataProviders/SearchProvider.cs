
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class SearchProvider : ISearchProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public SearchProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<SearchGlobalPostPage> GlobalPostPage(string UserId)
        {
            string usp = "usp_SearchGlobalPostPage @UserId";
            return _sqlDataAccess.LoadSingleRecord<SearchGlobalPostPage, dynamic>(usp, new { UserId = UserId });

        }

        public async Task<List<SearchGlobalPostPageSection>> GlobalPostPageSection(string UserId, int PageId)
        {
            string usp = "usp_SearchGlobalPostPageSection @UserID, @PageId";
            var x = await _sqlDataAccess.LoadData<SearchGlobalPostPageSection, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }

    }
}
