
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

        public async Task<string> CreatePostCheck(ContentTypeGroupCreatePost ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreateCheck @Sequence  , @LanguageId , @Name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeGroup);
            return CheckString;
        }

        public async Task<string> CreatePost(ContentTypeGroupCreatePost ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreate @Sequence, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeGroup);
            return String;
        }

        public async Task<List<ContentTypeGroup>> IndexGet(string UserId)
        {
            string usp = "usp_ContentTypeGroupIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<ContentTypeGroup> UpdateGet(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupUpdateGet @UserId, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroup, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });

        }

        public bool UpdatePost(ContentTypeGroupUpdateGet ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupUpdatePost @ContentTypeGroupId, @Sequence , @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ContentTypeGroupUpdateGet>(usp, ContentTypeGroup);
            return true;
        }

        public Task<List<ContentTypeGroupList>> List(string UserId)
        {
            string usp = "usp_ContentTypeGroupList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeGroupList, dynamic>(usp, new { UserId });
        }
    }
}
