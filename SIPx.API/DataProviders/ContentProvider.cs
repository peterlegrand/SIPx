
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ContentProvider : IContentProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public async Task<List<ClassificationViewGet>> GetClassifications(int LanguageId)
        //{
        //    string usp = "usp_ClassificationViewGet @LanguageID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationViewGet, dynamic>(usp, new { LanguageID = LanguageId });
        //    return x;
        //}
        public async Task<List<Content>> GetContents(string UserID)
        {
            string usp = "usp_Contents @UserID";
            var x = await _sqlDataAccess.LoadData<Content, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<ContentType>> GetContentTypes(string UserID)
        {
            string usp = "usp_ContentTypes @UserID";
            var x = await _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<LanguageList>> GetLanguageList(string UserID)
        {
            string usp = "usp_ContentCreateLanguages @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<ClassificationList>> GetClassificationList(string UserID, int ContentTypeID)
        {
            string usp = "usp_ContentCreateClassifications @UserID, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ClassificationList, dynamic>(usp, new { UserID = UserID, ContentTypeID = ContentTypeID });
            return x;
        }
        public async Task<List<OrganizationList>> GetOrganizationList(string UserID)
        {
            string usp = "usp_ContentCreateOrganizations @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserID = UserID});
            return x;
        }
        public async Task<ContentCreateListSet> GetContentCreateListSet(string UserID, int ContentTypeID)
        {
            string usp = "usp_ContentCreate1a @UserID, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentCreateListSet, dynamic>(usp, new { UserID = UserID, ContentTypeID = ContentTypeID });
            return x[0];
        }
        public async Task<List<ClassificationValueList>> GetContentCreateListSet2(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationValues @UserID, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });
            return x;
        }
        public List<ClassificationViewGet> GetClassifications2(int LanguageId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@LanguageID", LanguageId);
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = _sqlDataAccess.LoadData2<ClassificationViewGet>(usp, parameters );
            return x;
        }

        public Task<ClassificationViewGet> GetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationViewGet, dynamic>(usp, new { ClassificationId = Id, LanguageID = LanguageId });

        }
        public bool PostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @LanguageID, @StatusID, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @ModifierID , @ClassificationID , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        }
    }
}
