using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserPageProvider
    {
        Task<string> UserPageCreatePost(PageCreatePost Page);
        Task<string> UserPageCreatePostCheck(PageCreatePost Page);
        Task<List<PageIndexGet>> UserPageIndexGet(string UserId);
        Task<List<PageList>> UserPageListForMenu(string UserId);
        Task<List<PageList>> UserPageListForMenuTemplate(string UserId);
        Task<List<SequenceList>> UserPageSectionCreateGetSequence(string UserId, int PageId);
        Task<string> UserPageSectionCreatePost(PageSectionCreatePost PageSection);
        Task<string> UserPageSectionCreatePostCheck(PageSectionCreatePost PageSection);
        Task<List<PageSectionIndexGet>> UserPageSectionIndexGet(string UserId, int PageId);
        Task<PageSectionUpdateGet> UserPageSectionUpdateGet(string UserId, int PageSectionId);
        Task<PageUpdateGet> UserPageUpdateGet(string UserId, int PageId);
        Task<string> UserPageUpdatePost(PageUpdateGet Page);
        Task<string> UserPageUpdatePostCheck(PageUpdateGet Page);
    }
}