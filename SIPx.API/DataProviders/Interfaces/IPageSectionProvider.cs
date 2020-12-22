using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId);
        Task<string> CreatePost(PageSectionCreateGet PageSection);
        Task<string> CreatePostCheck(PageSectionCreateGet PageSection);
        Task<PageSectionDeleteGet> DeleteGet(string UserId, int PageSectionId);
        bool DeletePost(int Id);
        Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId);
        Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId);
        Task<string> UpdatePostCheck(PageSectionUpdateGet PageSection);
        bool UpdatePost(PageSectionUpdateGet PageSection);
    }
}