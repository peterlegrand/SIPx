
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

        public async Task<List<ContentStatus>> GetContentStatuses(string UserID)
        {
            string usp = "usp_ContentStatuses @UserID";
            var x = await _sqlDataAccess.LoadData<ContentStatus, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<ContentStatus> GetContentStatus(string UserID, int ContentStatusID)
        {
            string usp = "usp_ContentStatus @UserID, @ContentStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentStatus, dynamic>(usp, new { UserID = UserID, ContentStatusID = ContentStatusID });

        }
        public async Task<List<ContentTypeClassification>> GetContentTypeClassifications(string UserID, int ContentTypeID)
        {
            string usp = "usp_ContentTypeClassifications @UserID, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassification, dynamic>(usp, new { UserID = UserID, ContentTypeID = ContentTypeID });
            return x;
        }
        public Task<ContentTypeClassification> GetContentTypeClassification(string UserID, int ContentTypeClassificationID)
        {
            string usp = "usp_ContentTypeClassification @UserID, @ContentTypeClassificationID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassification, dynamic>(usp, new { UserID = UserID, ContentTypeClassificationID = ContentTypeClassificationID });

        }
        public async Task<List<ContentTypeClassificationStatus>> GetContentTypeClassificationStatuses(string UserID)
        {
            string usp = "usp_ContentTypeClassificationStatuses @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeClassificationStatus, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<ContentTypeClassificationStatus> GetContentTypeClassificationStatus(string UserID, int ContentTypeClassificationStatusID)
        {
            string usp = "usp_ContentTypeClassificationStatus @UserID, @ContentTypeClassificationStatusID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeClassificationStatus, dynamic>(usp, new { UserID = UserID, ContentTypeClassificationStatusID = ContentTypeClassificationStatusID });

        }
        public async Task<List<ContentTypeGroupLanguage>> GetContentTypeGroupLanguages(string UserID, int ContentTypeGroupID)
        {
            string usp = "usp_ContentTypeGroupLanguages @UserID, @ContentTypeGroupID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroupLanguage, dynamic>(usp, new { UserID = UserID, ContentTypeGroupID = ContentTypeGroupID });
            return x;
        }
        public Task<ContentTypeGroupLanguage> GetContentTypeGroupLanguage(string UserID, int ContentTypeGroupLanguageID)
        {
            string usp = "usp_ClassificationLanguage @UserID, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroupLanguage, dynamic>(usp, new { UserID = UserID, ClassificationLanguageID = ContentTypeGroupLanguageID });

        }
        public async Task<List<ContentTypeGroup>> GetContentTypeGroups(string UserID)
        {
            string usp = "usp_ContentTypeGroups @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeGroup, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<ContentTypeGroup> GetContentTypeGroup(string UserID, int ContentTypeGroupID)
        {
            string usp = "usp_ContentTypeGroup @UserID, @ContentTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeGroup, dynamic>(usp, new { UserID = UserID, ContentTypeGroupID = ContentTypeGroupID });

        }
        public async Task<List<ContentTypeLanguage>> GetContentTypeLanguages(string UserID, int ContentTypeID)
        {
            string usp = "usp_ContentTypeLanguages @UserID, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentTypeLanguage, dynamic>(usp, new { UserID = UserID, ContentTypeID = ContentTypeID });
            return x;
        }
        public Task<ContentTypeLanguage> GetContentTypeLanguage(string UserID, int ContentTypeLanguageID)
        {
            string usp = "usp_ContentTypeLanguage @UserID, @ContentTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeLanguage, dynamic>(usp, new { UserID = UserID, ContentTypeLanguageID = ContentTypeLanguageID });

        }
        public Task<List<ContentType>> GetContentTypes(string UserID)
        {
            string usp = "usp_ContentTypes @UserID";
            return _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ContentType> GetContentType(string UserID, int ContentTypeID)
        {
            string usp = "usp_ContentType @UserID, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentType, dynamic>(usp, new { UserID = UserID, ContentTypeID = ContentTypeID });

        }
    }
}
