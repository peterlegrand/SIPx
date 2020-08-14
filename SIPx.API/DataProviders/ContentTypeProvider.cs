
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
        public async Task<string> ContentTypeCreatePostCheck(ContentTypeCreatePost ContentType)
        {
            string usp = "usp_ContentTypeCreateCheck @ContentTypeGroupId, @ProcessTemplateId  ,@SecurityLevelId,  @LanguageId , @Name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
            return CheckString;
        }
        public async Task<string> ContentTypeCreatePost(ContentTypeCreatePost ContentType)
        {
            string usp = "usp_ContentTypeCreate @ContentTypeGroupId  , @ProcessTemplateId  , @LanguageId ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
            return String;
        }
        public async Task<List<ContentTypeLanguage>> ContentTypeLanguageIndexGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeLanguageIndexGet @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public Task<ContentTypeLanguage> ContentTypeLanguageUpdateGet(string UserId, int ContentTypeLanguageId)
        {
            string usp = "usp_ContentTypeLanguageUpdateGet @ContentTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeLanguage, dynamic>(usp, new { ContentTypeLanguageId = ContentTypeLanguageId });

        }
        public Task<List<ContentType>> ContentTypeIndexGet(string UserId)
        {
            string usp = "usp_ContentTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ContentTypeList>> ContentTypeList(string UserId)
        {
            string usp = "usp_ContentTypeList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ContentType> ContentTypeUpdateGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeUpdateGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentType, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }
    }
}
