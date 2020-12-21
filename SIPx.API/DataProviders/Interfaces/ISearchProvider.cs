using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISearchProvider
    {
        Task<SearchGlobalPostPage> GlobalPostPage(string UserId);
        Task<List<SearchGlobalPostPageSection>> GlobalPostPageSection(string UserId, int PageId);
    }
}