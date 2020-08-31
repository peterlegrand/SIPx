
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

        public async Task<List<ContentTypeClassificationIndexGet>> IndexGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeClassificationIndexGet @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassificationIndexGet, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }

        public Task<ContentTypeClassificationUpdateGet> UpdateGet(string UserId, int ContentTypeClassificationId)
        {
            string usp = "usp_ContentTypeClassificationUpdateIndex @UserId, @ContentTypeClassificationID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassificationUpdateGet, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationId = ContentTypeClassificationId });
        }

        public bool UpdatePost(ContentTypeClassificationUpdateGet ContentTypeClassification)
        {
            string usp = "usp_ContentTypeClassificationUpdatePost @ContentTypeClassificationId, @ContentTypeClassificationStatusId, @UserId";
            _sqlDataAccess.SaveData<ContentTypeClassificationUpdateGet>(usp, ContentTypeClassification);
            return true;
        }

    }
}
