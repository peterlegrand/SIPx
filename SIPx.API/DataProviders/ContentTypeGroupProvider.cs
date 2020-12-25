
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

        public async Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ContentTypeGroupCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ContentTypeGroupCreateGet ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreateCheck @Sequence  , @LanguageId , @Name ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ContentTypeGroup);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ContentTypeGroupCreateGet ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupCreatePost @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentTypeGroup);
            return String;
        }

        public async Task<List<ContentTypeGroupIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ContentTypeGroupIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroupIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<ContentTypeGroupUpdateGet> UpdateGet(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupUpdateGet @UserId, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroupUpdateGet, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeGroupUpdateGet ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupUpdatePostCheck @ContentTypeGroupId, @Sequence , @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ContentTypeGroup);
            return ErrorMessages;
        }
        public bool UpdatePost(ContentTypeGroupUpdateGet ContentTypeGroup)
        {
            string usp = "usp_ContentTypeGroupUpdatePost @ContentTypeGroupId, @Sequence , @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ContentTypeGroupUpdateGet>(usp, ContentTypeGroup);
            return true;
        }

        public Task<ContentTypeGroupDeleteGet> DeleteGet(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupDeleteGet @UserId, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroupDeleteGet, dynamic>(usp, new { UserId, ContentTypeGroupId });

        }

        public bool DeletePost(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupDeletePost @UserId, @ContentTypeGroupID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ContentTypeGroupId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupDeletePostCheck @UserId, @ContentTypeGroupID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ContentTypeGroupId });
            return ErrorMessages;
        }

        public Task<List<ContentTypeGroupList>> List(string UserId)
        {
            string usp = "usp_ContentTypeGroupList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeGroupList, dynamic>(usp, new { UserId });
        }

    }
}
