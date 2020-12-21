using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontUserPageSectionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId);
        Task<string> CreatePost(PageSectionCreateGet PageSection);
        Task<string> CreatePostCheck(PageSectionCreateGet PageSection);
        Task<PageSectionDeleteGet> DeleteGet(string UserId, int UserPageSectionId);
        bool DeletePost(int Id);
        Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId);
        Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId);
        bool UpdatePost(PageSectionUpdateGet PageSection);
    }
}