using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonProvider
    {
        Task<string> CreatePost(PersonCreatePost Person);
        Task<string> CreatePostCheck(PersonCreatePost Person);
        Task<PersonDeleteGet> DeleteGet(string UserId, int PersonId);
        bool DeletePost(int Id);
        Task<List<PersonIndexGet>> IndexGet(string UserId);
        Task<List<PersonList>> List();
        Task<PersonUpdateGet> UpdateGet(string UserId, int PersonId);
        bool UpdatePost(PersonUpdateGet Person);
        Task<List<PersonSearch>> Search(string Contains, string UserId);
        Task<List<PersonAdvancedSearchResult>> AdvancedSearch(string UserId, PersonAdvancedSearchPost AdvancedSearch);
        //List<PersonAdvancedSearchResult>
        Task<List<UserList>> CreateGetUsers();
        Task<List<UserList>> EditGetUsers(int PersonId);
    }
}