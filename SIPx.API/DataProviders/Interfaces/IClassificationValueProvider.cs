using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueProvider
    {
        Task<List<ClassificationValueAdvancedSearchResult>> AdvancedSearch(string UserId, ClassificationValueAdvancedSearchPost AdvancedSearch);
        Task<int> CreateGetDateLevel(int ClassificationId, int ClassificationValueId);
        Task<bool> CreatePost(ClassificationValueCreateGet ClassificationValue);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationValueCreateGet ClassificationValue);
        Task<ClassificationValueDeleteGet> DeleteGet(string UserId, int ClassificationValueId);
        bool DeletePost(string UserId, int ClassificationValueId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationValueId);
        Task<List<ClassificationValueIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId);
        Task<List<ClassificationValueList>> List(string UserId);
        Task<List<ClassificationValueList>> ListPerClassification(string UserId, int ClassificationId);
        Task<List<ClassificationValueForPanel>> Panel(string UserId, string ClassificationValueConditionSQLFrom, string ClassificationValueConditionSQLWhere, string ClassificationValueConditionSQLContains);
        Task<List<ClassificationValueForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<ClassificationValueSearch>> Search(string Contains, string UserId);
        Task<ClassificationValueUpdateGet> UpdateGet(string UserId, int ClassificationValueId);
        bool UpdatePost(ClassificationValueUpdateGet ClassificationValue);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValueUpdateGet ClassificationValue);
    }
}