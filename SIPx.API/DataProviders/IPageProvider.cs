using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<List<Page>> PageIndexGet(string UserId);
        Task<List<PageLanguage>> PageLanguageIndexGet(string UserId, int PageId);
        Task<PageLanguage> PageLanguageUpdateGet(string UserId, int PageLanguageId);
        Task<List<PageSectionDataTypeList>> PageSectionDataTypeList(string UserId);
        Task<List<PageSectionTypeList>> PageSectionTypeList(string UserId);
        Task<Page> PageUpdateGet(string UserId, int PageId);
    }
}