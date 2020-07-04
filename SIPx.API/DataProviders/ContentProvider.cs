
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
        //    var x = await _sqlDataAccess.LoadData<ClassificationViewGet, dynamic>(usp, new { LanguageId = LanguageId });
        //    return x;
        //}
        public async Task<List<Content>> GetContents(string UserId)
        {
            string usp = "usp_Contents @UserID";
            var x = await _sqlDataAccess.LoadData<Content, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ContentType>> GetContentTypes(string UserId)
        {
            string usp = "usp_ContentTypes @UserID";
            var x = await _sqlDataAccess.LoadData<ContentType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> GetLanguageList(string UserId)
        {
            string usp = "usp_ContentCreateLanguages @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ClassificationList>> GetClassificationList(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentCreateClassifications @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ClassificationList, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public async Task<List<OrganizationList>> GetOrganizationList(string UserId)
        {
            string usp = "usp_ContentCreateOrganizations @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<ContentCreateListSet> GetContentCreateListSet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentCreate1a @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentCreateListSet, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x[0];
        }
        public async Task<List<ClassificationValueList>> GetContentCreateListSet2(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValues @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public List<ClassificationIndexGet> GetClassifications2(int LanguageId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@LanguageID", LanguageId);
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = _sqlDataAccess.LoadData2<ClassificationIndexGet>(usp, parameters );
            return x;
        }

        public Task<ClassificationIndexGet> GetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationIndexGet, dynamic>(usp, new { ClassificationId = Id, LanguageId = LanguageId });

        }
        public bool PostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @LanguageId, @StatusId, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @ModifierId , @ClassificationId , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        }
    }
}
