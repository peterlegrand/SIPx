
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
    public class ContentStatusProvider : IContentStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ContentStatus>> ContentStatusIndexGet(string UserId)
        {
            string usp = "usp_ContentStatusIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentStatus> ContentStatusUpdateGet(string UserId, int ContentStatusId)
        {
            string usp = "usp_ContentStatusUpdateGet @UserId, @ContentStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentStatus, dynamic>(usp, new { UserId = UserId, ContentStatusId = ContentStatusId });

        }
    }
}
