
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
    public class ContentTypePropertyProvider : IContentTypePropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypePropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet ContentTypeProperty)
        {
            string usp = "usp_ContentTypePropertyCreatePostCheck @ObjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ContentTypeProperty);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ObjectTypePropertyCreateGet ContentTypeProperty)
        {
            string usp = "usp_ContentTypePropertyCreatePost @ObjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeProperty);
            return String;
        }

        public Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypePropertyIndexGet @UserID, @ContentTypeId";
            return _sqlDataAccess.LoadData<ObjectTypePropertyIndexGetGrid, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }

        public Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int ContentTypePropertyId)
        {
            string usp = "usp_ContentTypePropertyUpdateGet @UserId, @ContentTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyUpdateGet, dynamic>(usp, new { UserId = UserId, ContentTypePropertyId = ContentTypePropertyId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet ContentTypeProperty)
        {
            string usp = "usp_ContentTypePropertyUpdatePostCheck @ContentTypePropertyId , @PropertyId, @ContentTypePropertyStatusId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ContentTypeProperty);
            return ErrorMessages;
        }

        public bool UpdatePost(ObjectTypePropertyUpdateGet ContentTypeProperty)
        {
            string usp = "usp_ContentTypePropertyUpdatePost @ContentTypePropertyId ,  @PropertyId, @ContentTypePropertyStatusId, @UserId ";
            _sqlDataAccess.SaveData<ObjectTypePropertyUpdateGet>(usp, ContentTypeProperty);
            return true;
        }

        public Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int ContentTypePropertyId)
        {
            string usp = "usp_ContentTypePropertyDeleteGet @UserId, @ContentTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyDeleteGet, dynamic>(usp, new { UserId, ContentTypePropertyId });

        }

        public bool DeletePost(string UserId, int ContentTypePropertyId)
        {
            string usp = "usp_ContentTypePropertyDeletePost @UserId, @ContentTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ContentTypePropertyId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypePropertyId)
        {
            string usp = "usp_ContentTypePropertyDeletePostCheck @UserId, @ContentTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ContentTypePropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ContentTypePropertyId });
            return ErrorMessages;
        }

        //PETER TODO Not sure when this is used.
        public async Task<List<ObjectTypePropertyList>> List(string UserId)
        {
            string usp = "usp_ContentTypePropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<ObjectTypePropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
