using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentProvider
    {
        Task<List<ContentAdvancedSearchResult>> AdvancedSearch(string UserId, ContentAdvancedSearchPost AdvancedSearch);
        Task<List<ContentTypeCreateGet>> ContentTypesCreateGet(string UserId);
        Task<ClassificationIndexGet> CreateGetClassificationById(int Id, int LanguageId);
        Task<List<ClassificationList>> CreateGetClassificationList(string UserId, int ContentTypeId);
        List<ClassificationIndexGet> CreateGetClassifications2(int LanguageId);
        Task<ContentCreateListSet> CreateGetContentCreateListSet(string UserId, int ContentTypeId);
        Task<List<ClassificationValueList>> CreateGetContentCreateListSet2(string UserId, int ClassificationId);
        Task<List<LanguageList>> CreateGetLanguageList(string UserId);
        Task<List<OrganizationList>> CreateGetOrganizationList(string UserId);
        bool CreatePostClassification(ClassificationCreatePost Classification);
        Task<ContentDeleteGet> DeleteGet(string UserId, int ContentId);
        bool DeletePost(string UserId, int ContentId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentId);
        Task<List<Content>> IndexGet(string UserId);
        Task<List<ContentList>> List();
        Task<List<ContentForPanel>> Panel(string ContentConditionSQLFrom, string ContentConditionSQLWhere, string ContentConditionSQLContains);
        Task<List<ContentForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<ContentSearch>> Search(string Contains, string UserId);
        bool UpdatePostClassification(ClassificationUpdatePost Classification);
    }
}