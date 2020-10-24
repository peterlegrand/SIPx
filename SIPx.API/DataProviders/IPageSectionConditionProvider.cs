using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionContentConditionProvider
    {
        Task<string> CreatePost(PageSectionContentConditionCreateGet PageSectionContentCondition);
        Task<string> CreatePostCheck(PageSectionContentConditionCreateGet PageSectionContentCondition);
        Task<PageSectionContentConditionDeleteGet> DeleteGet(string UserId, int PageSectionContentConditionId);
        bool DeletePost(int PageSectionContentConditionId);
        Task<List<PageSectionContentConditionIndexGet>> IndexGet(string UserId, int PageSectionId);
        Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<PageSectionContentConditionUpdateGet> UpdateGet(string UserId, int PageSectionContentConditionId);
        bool UpdatePost(PageSectionContentConditionUpdateGet PageSectionContentCondition);
          Task<List<PageSectionContentConditionCreateGetClassifications>> CreateGetClassifications(string UserId);
        Task<List<ClassificationValueList>> CreateGetClassificationValues(string UserId, int ClassificationId);

    }
}