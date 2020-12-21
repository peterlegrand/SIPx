using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueProvider
    {
        Task<bool> CreatePost(ClassificationValueCreatePost ClassificationValue);
        Task<string> CreatePostCheck(ClassificationValueCreatePost ClassificationValue);
        Task<List<ClassificationValueIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId);
        Task<ClassificationValueUpdateGet> UpdateGet(string UserId, int ClassificationValueId);
        bool UpdatePost(ClassificationValueUpdateGet ClassificationValue);
        bool DeletePost(int Id);
        Task<ClassificationValueDeleteGet> DeleteGet(string UserId, int ClassificationValueId);
        Task<int> CreateGetDateLevel(int ClassificationId, int ClassificationValueId);
        Task<List<ClassificationValueSearch>> Search(string Contains, string UserId);
        Task<List<ClassificationValueAdvancedSearchResult>> AdvancedSearch(string UserId, ClassificationValueAdvancedSearchPost AdvancedSearch);
//        Task<string> AdvancedSearch(string UserId, ClassificationValueAdvancedSearchPost AdvancedSearch);
        Task<List<ClassificationValueList>> List(string UserId);
        Task<List<ClassificationValueList>> ListPerClassification(string UserId, int ClassificationId);
        Task<List<ClassificationValueForPanel>> Panel(string UserId, string ConditionSQLFrom, string ConditionSQLWhere, string ConditionSQLContains);
        Task<List<ClassificationValueForPanelCondition>> PanelCondition(int PageSectionId);
    }
}