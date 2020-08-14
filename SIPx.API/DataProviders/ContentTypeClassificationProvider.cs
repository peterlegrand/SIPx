
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
    public class ContentTypeClassificationProvider : IContentTypeClassificationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypeClassificationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ContentTypeClassification>> ContentTypeClassificationIndexGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeClassificationIndexGet @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassification, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public Task<ContentTypeClassification> ContentTypeClassificationUpdateGet(string UserId, int ContentTypeClassificationId)
        {
            string usp = "usp_ContentTypeClassificationUpdateIndex @UserId, @ContentTypeClassificationID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassification, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationId = ContentTypeClassificationId });

        }
    }
}
