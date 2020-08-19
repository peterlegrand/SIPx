using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserPageProvider
    {
        Task<string> CreatePost(PageCreateGet Page);
        Task<string> CreatePostCheck(PageCreatePost Page);
        Task<PageDeleteGet> DeleteGet(string UserId, int PageId);
        bool DeletePost(PageDeleteGet Page);
        Task<List<PageIndexGet>> IndexGet(string UserId);
        Task<List<PageList>> ListForMenu(string UserId);
        Task<List<PageList>> ListForMenuTemplate(string UserId);
        Task<PageUpdateGet> UpdateGet(string UserId, int PageId);
        Task<string> UpdatePost(PageUpdateGet Page);
        Task<string> UpdatePostCheck(PageUpdateGet Page);
    }
}