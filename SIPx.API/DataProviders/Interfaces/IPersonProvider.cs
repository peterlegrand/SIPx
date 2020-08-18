using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonProvider
    {
        Task<string> CreatePost(PersonCreatePost Person);
        Task<string> CreatePostCheck(PersonCreatePost Person);
        Task<List<PersonIndexGet>> IndexGet(string UserId);
        Task<List<PersonList>> List(string UserId);
        Task<PersonUpdateGet> UpdateGet(string UserId, int PersonId);
        bool UpdatePost(PersonUpdateGet Person);
    }
}