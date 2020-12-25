using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<string> CreatePost(PageCreateGet Page);
        Task<List<ErrorMessage>> CreatePostCheck(PageCreateGet Page);
        Task<PageDeleteGet> DeleteGet(string UserId, int PageId);
        bool DeletePost(string UserId, int PageId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PageId);
        Task<List<PageIndexGet>> IndexGet(string UserId);
        Task<List<PageLanguageIndexGet>> LanguageIndexGet(string UserId, int PageId);
        Task<PageLanguageIndexGet> LanguageUpdateGet(string UserId, int PageLanguageId);
        Task<List<PageList>> ListForMenu(string UserId);
        Task<List<PageList>> ListForMenuTemplate(string UserId);
        Task<PageUpdateGet> UpdateGet(string UserId, int PageId);
        bool UpdatePost(PageUpdateGet Page);
        Task<List<ErrorMessage>> UpdatePostCheck(PageUpdateGet Page);
    }
}