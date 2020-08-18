
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
    public class ContentTypeClassificationStatusProvider : IContentTypeClassificationStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypeClassificationStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ContentTypeClassificationStatus>> ContentTypeClassificationStatusIndexGet(string UserId)
        {
            string usp = "usp_ContentTypeClassificationStatusIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        //PETER This is a uiterms table

        //public Task<ContentTypeClassificationStatus> ContentTypeClassificationStatusUpdateGet(string UserId, int ContentTypeClassificationStatusId)
        //{
        //    string usp = "usp_ContentTypeClassificationStatusUpdateGet @UserId, @ContentTypeClassificationStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationStatusId = ContentTypeClassificationStatusId });

        //}
    }
}
