using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionConditionProvider
    {
        Task<string> CreatePost(PageSectionConditionCreateGet PageSectionCondition);
        Task<string> CreatePostCheck(PageSectionConditionCreateGet PageSectionCondition);
        Task<PageSectionConditionDeleteGet> DeleteGet(string UserId, int PageSectionConditionId);
        bool DeletePost(int PageSectionConditionId);
        Task<List<PageSectionConditionIndexGet>> IndexGet(string UserId, int PageSectionId);
        Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<PageSectionConditionUpdateGet> UpdateGet(string UserId, int PageSectionConditionId);
        bool UpdatePost(PageSectionConditionUpdateGet PageSectionCondition);
    }
}