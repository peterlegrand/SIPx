
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

        public async Task<List<Content>> IndexGet(string UserId)
        {
            string usp = "usp_Contents @UserID";
            var x = await _sqlDataAccess.LoadData<Content, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<ContentTypeCreateGet>> ContentTypesCreateGet(string UserId)
        {
            string usp = "usp_ContentTypeCreateGet @UserID";
            var x = await _sqlDataAccess.LoadData<ContentTypeCreateGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<LanguageList>> CreateGetLanguageList(string UserId)
        {
            string usp = "usp_ContentCreateLanguages @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<ClassificationList>> CreateGetClassificationList(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentCreateClassifications @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ClassificationList, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }

        public async Task<List<OrganizationList>> CreateGetOrganizationList(string UserId)
        {
            string usp = "usp_ContentCreateOrganizations @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<ContentCreateListSet> CreateGetContentCreateListSet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentCreate1a @UserId, @ContentTypeID";
            var x = await _sqlDataAccess.LoadData<ContentCreateListSet, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x[0];
        }

        public async Task<List<ContentForPanel>> ContentForPanel(string UserId)
        {
            string usp = "usp_ContentForPanel @UserId";
            var x = await _sqlDataAccess.LoadData<ContentForPanel, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<ClassificationValueList>> CreateGetContentCreateListSet2(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValues @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }

        public List<ClassificationIndexGet> CreateGetClassifications2(int LanguageId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@LanguageID", LanguageId);
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = _sqlDataAccess.LoadData2<ClassificationIndexGet>(usp, parameters);
            return x;
        }

        public Task<ClassificationIndexGet> CreateGetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationIndexGet, dynamic>(usp, new { ClassificationId = Id, LanguageId = LanguageId });

        }

        public bool CreatePostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @LanguageId, @StatusId, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }

        public bool UpdatePostClassification(ClassificationUpdatePost Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @ModifierId , @ClassificationId , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<ClassificationUpdatePost>(usp, Classification);
            return true;
        }

        public Task<ContentDeleteGet> DeleteGet(string UserId, int ContentId)
        {
            string usp = "usp_ContentDeleteGet @UserId, @ContentID";
            return _sqlDataAccess.LoadSingleRecord<ContentDeleteGet, dynamic>(usp, new { UserId, ContentId });

        }

        public bool DeletePost(int ContentId)
        {
            string usp = "usp_ContentDeletePost @ContentId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ContentId = ContentId });
            return true;
        }
        public Task<List<ContentSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_ContentSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<ContentSearch, dynamic>(usp, new { Contains, UserId });
        }
        public async Task<List<ContentAdvancedSearchResult>> AdvancedSearch(string UserId, ContentAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_ContentAdvancedSearch @UserId, @Contains, @OrganizationId, @ProjectId, @ContentTypeId, @ContentStatusId, @LanguageId, @ClassificationValueTable";
            System.Data.DataTable ClassificationValueTable = ContentClassificationValueDataTable.CreateTable();
            var xy = new List<int>();

            foreach (var x in AdvancedSearch.ClassificationValueIds)
            {
                if (x != null && x != 0)
                {
                    ClassificationValueTable.Rows.Add(

                    x);
                }
            }
            var result = await _sqlDataAccess.LoadData<ContentAdvancedSearchResult,dynamic>(usp, new { UserId = AdvancedSearch.UserId, Contains = AdvancedSearch.Contains , OranizationId = AdvancedSearch.OrganizationId , ProjectId = AdvancedSearch.ProjectId, ContentTypeId = AdvancedSearch.ContentTypeId, ContentStatusId = AdvancedSearch.ContentStatusId , LanguageId= AdvancedSearch.LanguageId , ClassificationValueTable = ClassificationValueTable.AsTableValuedParameter("udt_ContentAdvancedSearchClassificationValues") });
            return result;



        }


    }
}
