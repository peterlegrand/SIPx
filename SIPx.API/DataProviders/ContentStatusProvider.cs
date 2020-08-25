
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
        public async Task<List<ContentStatus>> IndexGet(string UserId)
        {
            string usp = "usp_ContentStatusIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        //PETER I don't think we need this as it is a uiterm table
        //public Task<ContentStatus> UpdateGet(string UserId, int ContentStatusId)
        //{
        //    string usp = "usp_ContentStatusUpdateGet @UserId, @ContentStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ContentStatus, dynamic>(usp, new { UserId = UserId, ContentStatusId = ContentStatusId });

        //}
        public async Task<List<ContentStatusList>> List(string UserId)
        {
            string usp = "usp_ContentStatusList @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatusList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
