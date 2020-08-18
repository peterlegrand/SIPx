using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserPageSectionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId);
        Task<string> CreatePost(PageSectionCreatePost PageSection);
        Task<string> CreatePostCheck(PageSectionCreatePost PageSection);
        Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId);
        Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId);
    }
}