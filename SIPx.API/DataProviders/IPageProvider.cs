using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<List<PageIndexGet>> PageIndexGet(string UserId);
        Task<List<PageLanguageIndexGet>> PageLanguageIndexGet(string UserId, int PageId);
        Task<PageLanguageIndexGet> PageLanguageUpdateGet(string UserId, int PageLanguageId);
        Task<List<PageSectionDataTypeList>> PageSectionDataTypeList(string UserId);
        Task<List<PageSectionIndexGet>> PageSectionIndexGet(string UserId, int PageId);
        Task<List<PageSectionLanguageIndexGet>> PageSectionLanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> PageSectionLanguageUpdateGet(string UserId, int PageLanguageId);
        Task<List<PageSectionTypeList>> PageSectionTypeList(string UserId);
        Task<PageSectionUpdateGet> PageSectionUpdateGet(string UserId, int PageSectionId);
        Task<PageUpdateGet> PageUpdateGet(string UserId, int PageId);
    }
}