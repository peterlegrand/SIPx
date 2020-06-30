
using Dapper;
using SIPx.API.ViewModels;
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

        public async Task<List<ContentStatus>> GetContentStatuses(string UserId)
        {
            string usp = "usp_ContentStatuses @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentStatus> GetContentStatus(string UserId, int ContentStatusId)
        {
            string usp = "usp_ContentStatus @UserId, @ContentStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentStatus, dynamic>(usp, new { UserId = UserId, ContentStatusId = ContentStatusId });

        }
        public async Task<List<ContentTypeClassification>> GetContentTypeClassifications(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeClassifications @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassification, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public Task<ContentTypeClassification> GetContentTypeClassification(string UserId, int ContentTypeClassificationId)
        {
            string usp = "usp_ContentTypeClassification @UserId, @ContentTypeClassificationID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassification, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationId = ContentTypeClassificationId });

        }
        public async Task<List<ContentTypeClassificationStatus>> GetContentTypeClassificationStatuses(string UserId)
        {
            string usp = "usp_ContentTypeClassificationStatuses @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentTypeClassificationStatus> GetContentTypeClassificationStatus(string UserId, int ContentTypeClassificationStatusId)
        {
            string usp = "usp_ContentTypeClassificationStatus @UserId, @ContentTypeClassificationStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassificationStatus, dynamic>(usp, new { UserId = UserId, ContentTypeClassificationStatusId = ContentTypeClassificationStatusId });

        }
        public async Task<List<ContentTypeGroupLanguage>> GetContentTypeGroupLanguages(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroupLanguages @UserId, @ContentTypeGroupID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroupLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });
            return x;
        }
        public Task<ContentTypeGroupLanguage> GetContentTypeGroupLanguage(string UserId, int ContentTypeGroupLanguageId)
        {
            string usp = "usp_ClassificationLanguage @UserId, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroupLanguage, dynamic>(usp, new { UserId = UserId, ClassificationLanguageId = ContentTypeGroupLanguageId });

        }
        public async Task<List<ContentTypeGroup>> GetContentTypeGroups(string UserId)
        {
            string usp = "usp_ContentTypeGroups @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ContentTypeGroup> GetContentTypeGroup(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_ContentTypeGroup @UserId, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroup, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });

        }
        public async Task<List<ContentTypeLanguage>> GetContentTypeLanguages(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeLanguages @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public Task<ContentTypeLanguage> GetContentTypeLanguage(string UserId, int ContentTypeLanguageId)
        {
            string usp = "usp_ContentTypeLanguage @UserId, @ContentTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeLanguageId = ContentTypeLanguageId });

        }
        public Task<List<ContentType>> GetContentTypes(string UserId)
        {
            string usp = "usp_ContentTypes @UserID";
            return _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ContentType> GetContentType(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentType @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentType, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }
    }
}
