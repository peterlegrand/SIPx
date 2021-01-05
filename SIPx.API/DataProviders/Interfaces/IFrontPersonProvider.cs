using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontPersonProvider
    {
        Task<string> CreatePost(FrontPersonCreateGet Person);
        Task<List<ErrorMessage>> CreatePostCheck(FrontPersonCreateGet Person);
        Task<FrontPersonAdvancedSearchGet> FrontPersonAdvancedSearchGet(string UserId);
        Task<List<FrontPersonSearchResult>> FrontPersonAdvancedSearchPost(FrontPersonAdvancedSearchGet SearchData);
        Task<FrontPersonUpdateGet> UpdateGet(string UserId, int PersonId);
        bool UpdatePost(FrontPersonUpdateGet Person);
        Task<List<ErrorMessage>> UpdatePostCheck(FrontPersonUpdateGet Person);
        Task<int> UpdateGetCheckIfNonUser(int SelectedPersonId);
    }
}