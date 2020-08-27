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
    }
}