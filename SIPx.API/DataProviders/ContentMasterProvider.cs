
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
    public class ContentMasterProvider : IContentMasterProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentMasterProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ContentStatus>> ContentStatusIndexGet(string UserId)
        {
            string usp = "usp_ContentStatusIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentStatus> ContentStatusUpdateGet(string UserId, int ContentStatusId)
        {
            string usp = "usp_ContentStatusUpdateGet @UserId, @ContentStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentStatus, dynamic>(usp, new { UserId = UserId, ContentStatusId = ContentStatusId });

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
        public async Task<List<ContentTypeClassificationStatus>> ContentTypeClassificationStatusIndexGet(string UserId)
        {
            string usp = "usp_ContentTypeClassificationStatusIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentTypeClassificationStatus> ContentTypeClassificationStatusUpdateGet(string UserId, int ContentTypeClassificationStatusId)
        {
            string usp = "usp_ContentTypeClassificationStatusUpdateGet @UserId, @ContentTypeClassificationStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationStatusId = ContentTypeClassificationStatusId });

        }
        public async Task<List<ContentTypeGroupLanguage>> ContentTypeGroupLanguageIndexGet(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupLanguageIndexGet @UserId, @ContentTypeGroupID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroupLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });
            return x;
        }
        public Task<ContentTypeGroupLanguage> ContentTypeGroupLanguageUpdateGet(string UserId, int ContentTypeGroupLanguageId)
        {
            string usp = "usp_ContentTypeGroupLanguageUpdateGet @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroupLanguage, dynamic>(usp, new { ClassificationLanguageId = ContentTypeGroupLanguageId });

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
