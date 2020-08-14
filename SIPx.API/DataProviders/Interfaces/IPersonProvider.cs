using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonProvider
    {
        Task<string> PersonCreatePost(PersonCreatePost Person);
        Task<string> PersonCreatePostCheck(PersonCreatePost Person);
        Task<List<PersonIndexGet>> PersonIndexGet(string UserId);
        Task<List<PersonList>> PersonList(string UserId);
        Task<PersonUpdateGet> PersonUpdateGet(string UserId, int PersonId);
    }
}