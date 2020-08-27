using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontPersonProvider
    {
        Task<FrontPersonAdvancedSearchGet> FrontPersonAdvancedSearchGet(string UserId);
        Task<List<FrontPersonSearchResult>> FrontPersonAdvancedSearchPost(FrontPersonAdvancedSearchGet SearchData);
    }
}