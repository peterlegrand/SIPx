
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ClassificationValueProvider : IClassificationValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<int> CreateGetDateLevel(int ClassificationId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueCreateGet @ClassificationId, @ClassificationValueId";
            return await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { ClassificationId, ClassificationValueId });

        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ClassificationValueCreateGet ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePostCheck @ClassificationId, @ParentId, @LanguageId , @Name, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationValue);
            return ErrorMessages;
        }

        public async Task<bool> CreatePost(ClassificationValueCreateGet ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePost @ClassificationId, @ParentId, @DateFrom, @DateTo, @Name, @Description, @MenuName, @MouseOver, @DropDownName, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @UserId ";
            _sqlDataAccess.SaveData<ClassificationValueCreateGet>(usp, ClassificationValue);
            return true;
        }

        public async Task<List<ClassificationValueIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;

        }

        public Task<ClassificationValueUpdateGet> UpdateGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueUpdateGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValueUpdateGet ClassificationValue)
        {
            string usp = "usp_ClassificationValueUpdatePostCheck @ClassificationValueId, @DateFrom, @DateTo, @Name, @Description, @MenuName, @MouseOver, @DropDownName, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ClassificationValue);
            return ErrorMessages;
        }

        public bool UpdatePost(ClassificationValueUpdateGet ClassificationValue)
        {
            string usp = "usp_ClassificationValueUpdatePost @ClassificationValueId, @DateFrom, @DateTo, @Name, @Description, @MenuName, @MouseOver, @DropDownName, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @UserId";
            _sqlDataAccess.SaveData<ClassificationValueUpdateGet>(usp, ClassificationValue);
            return true;
        }

        public async Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueLanguageIndex @UserId, @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
            return x;
        }

        public Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId)
        {
            string usp = "usp_ClassificationValueLanguageUpdateGet @UserId, @ClassificationValueLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueLanguageId });

        }

        public Task<ClassificationValueDeleteGet> DeleteGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueDeleteGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueDeleteGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }

        public bool DeletePost(int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueDeletePost @ClassificationValueId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationValueId = ClassificationValueId });
            return true;
        }

        public Task<List<ClassificationValueSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_ClassificationValueSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<ClassificationValueSearch, dynamic>(usp, new { Contains, UserId });

        }
       public Task<List<ClassificationValueAdvancedSearchResult>> AdvancedSearch(string UserId, ClassificationValueAdvancedSearchPost AdvancedSearch)
    //    public async Task<string> AdvancedSearch(string UserId, ClassificationValueAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_ClassificationValueAdvancedSearch @UserId, @Contains, @ClassificationId, @DateLevelId, @DateFrom, @DateTo, @PersonId";
//            var x = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, AdvancedSearch);
  //          return x;
      return _sqlDataAccess.LoadData<ClassificationValueAdvancedSearchResult, dynamic>(usp, AdvancedSearch);
        }

        public async Task<List<ClassificationValueList>> List(string UserId)
        {
            string usp = "usp_ClassificationValueList @UserID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ClassificationValueList>> ListPerClassification(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueListPerClassification @UserID, @ClassificationId";
            var x = await _sqlDataAccess.LoadData<ClassificationValueList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public async Task<List<ClassificationValueForPanel>> Panel(string UserId, string ClassificationValueConditionSQLFrom, string ClassificationValueConditionSQLWhere, string ClassificationValueConditionSQLContains)
        {
            string usp = "usp_ClassificationValueForPanel @UserId, @ClassificationValueConditionSQLFrom, @ClassificationValueConditionSQLWhere,@ClassificationValueConditionSQLContains ";
            var x = await _sqlDataAccess.LoadData<ClassificationValueForPanel, dynamic>(usp, new { UserId = UserId, ClassificationValueConditionSQLFrom = ClassificationValueConditionSQLFrom, ClassificationValueConditionSQLWhere = ClassificationValueConditionSQLWhere, ClassificationValueConditionSQLContains = ClassificationValueConditionSQLContains });
            return x;
        }
        public async Task<List<ClassificationValueForPanelCondition>> PanelCondition(int PageSectionId)
        {
            string usp = "usp_ClassificationValueForPanelCondition @PageSectionId";
            var x = await _sqlDataAccess.LoadData<ClassificationValueForPanelCondition, dynamic>(usp, new { PageSectionId = PageSectionId });
            return x;
        }
    }
}