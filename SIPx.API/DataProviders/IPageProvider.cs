using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<Page> GetPage(string UserId, int PageId);
        Task<PageLanguage> GetPageLanguage(string UserId, int PageLanguageId);
        Task<List<PageLanguage>> GetPageLanguages(string UserId, int PageId);
        Task<List<Page>> GetPages(string UserId);
        Task<List<PageSectionDataTypeList>> GetPageSectionDataTypeList(string UserId);
        Task<List<PageSectionTypeList>> GetPageSectionTypeList(string UserId);
    }
}