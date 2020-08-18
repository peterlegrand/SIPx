using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageProvider
    {
        Task<string> CreatePost(PageCreatePost Page);
        Task<string> CreatePostCheck(PageCreatePost Page);
        Task<List<PageIndexGet>> IndexGet(string UserId);
        Task<List<PageLanguageIndexGet>> LanguageIndexGet(string UserId, int PageId);
        Task<PageLanguageIndexGet> LanguageUpdateGet(string UserId, int PageLanguageId);
        Task<PageUpdateGet> UpdateGet(string UserId, int PageId);
        Task<List<PageList>> ListForMenuTemplate(string UserId);
        Task<List<PageList>> ListForMenu(string UserId);
    }
}