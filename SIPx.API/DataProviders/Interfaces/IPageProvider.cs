using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<string> PageCreatePost(PageCreatePost Page);
        Task<string> PageCreatePostCheck(PageCreatePost Page);
        Task<List<PageIndexGet>> PageIndexGet(string UserId);
        Task<List<PageLanguageIndexGet>> PageLanguageIndexGet(string UserId, int PageId);
        Task<PageLanguageIndexGet> PageLanguageUpdateGet(string UserId, int PageLanguageId);
        Task<List<SequenceList>> PageSectionCreateGetSequence(string UserId, int PageId);
        Task<string> PageSectionCreatePost(PageSectionCreatePost PageSection);
        Task<string> PageSectionCreatePostCheck(PageSectionCreatePost PageSection);
        Task<List<PageSectionDataTypeList>> PageSectionDataTypeList(string UserId);
        Task<List<PageSectionIndexGet>> PageSectionIndexGet(string UserId, int PageId);
        Task<List<PageSectionLanguageIndexGet>> PageSectionLanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> PageSectionLanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<List<PageSectionTypeList>> PageSectionTypeList(string UserId);
        Task<PageSectionUpdateGet> PageSectionUpdateGet(string UserId, int PageSectionId);
        Task<PageUpdateGet> PageUpdateGet(string UserId, int PageId);
        Task<List<PageList>> PageListForMenuTemplate(string UserId);
        Task<List<PageList>> PageListForMenu(string UserId);
    }
}