using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId);
        Task<string> CreatePost(PageSectionCreatePost PageSection);
        Task<string> CreatePostCheck(PageSectionCreatePost PageSection);
        Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId);
        Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId);
        bool UpdatePost(PageSectionUpdateGet PageSection);
    }
}