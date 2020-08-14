
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
    public class ContentTypeGroupProvider : IContentTypeGroupProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypeGroupProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<ContentTypeGroupList>> ContentTypeGroupList(string UserId)
        {
            string usp = "usp_ContentTypeGroupList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeGroupList, dynamic>(usp, new { UserId });
        }
        public async Task<string> ContentTypeGroupCreatePostCheck(ContentTypeGroupCreatePost ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreateCheck @Sequence  , @LanguageId , @Name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeGroup);
            return CheckString;
        }
        public async Task<string> ContentTypeGroupCreatePost(ContentTypeGroupCreatePost ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreate @Sequence  , @LanguageId , @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeGroup);
            return String;
        }
        public async Task<List<ContentTypeGroup>> ContentTypeGroupIndexGet(string UserId)
        {
            string usp = "usp_ContentTypeGroupIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentTypeGroup> ContentTypeGroupUpdateGet(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupUpdateGet @UserId, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroup, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });

        }
    }
}
