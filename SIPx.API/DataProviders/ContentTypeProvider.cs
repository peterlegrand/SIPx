
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
    public class ContentTypeProvider : IContentTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(ContentTypeCreatePost ContentType)
        {
            string usp = "usp_ContentTypeCreateCheck @ContentTypeGroupId, @ProcessTemplateId  ,@SecurityLevelId,  @LanguageId , @Name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
            return CheckString;
        }
        //PETER Probably this doesn't work as the table as parameter needs to be inserted
        //see sp name of update or create without post
        public async Task<string> CreatePost(ContentTypeCreatePost ContentType)
        {
            string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId  , @ProcessTemplateId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
            return String;
        }

        public Task<List<ContentType>> IndexGet(string UserId)
        {
            string usp = "usp_ContentTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ContentTypeUpdateGet> UpdateGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeUpdateGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }

        public bool UpdatePost(ContentTypeUpdateGet ContentType)
        {
            string usp = "usp_ContentTypeUpdatePost @ContentTypeId, @ContentTypeGroupId  , @ProcessTemplateId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ContentTypeUpdateGet>(usp, ContentType);
            return true;
        }

        public async Task<List<ContentTypeLanguage>> LanguageIndexGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeLanguageIndexGet @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }

        public Task<ContentTypeLanguage> LanguageUpdateGet(string UserId, int ContentTypeLanguageId)
        {
            string usp = "usp_ContentTypeLanguageUpdateGet @ContentTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeLanguage, dynamic>(usp, new { ContentTypeLanguageId = ContentTypeLanguageId });

        }

        public Task<List<ContentTypeList>> List(string UserId)
        {
            string usp = "usp_ContentTypeList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeleteGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeDeleteGet, dynamic>(usp, new { UserId, ContentTypeId });

        }
        public bool DeletePost(int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeletePost @ContentTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ContentTypeId = ContentTypeId });
            return true;
        }

    }
}
