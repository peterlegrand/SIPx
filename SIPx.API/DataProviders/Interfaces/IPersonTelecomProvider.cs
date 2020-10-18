using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonTelecomProvider
    {
        Task<PersonTelecomDeleteGet> DeleteGet(string UserId, int PersonTelecomId);
        bool DeletePost(int Id);
        Task<string> CreatePost(PersonTelecomCreateGet PersonTelecom);
        Task<string> CreatePostCheck(PersonTelecomCreateGet PersonTelecom);
        Task<List<PersonTelecomIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonTelecomUpdateGet> UpdateGet(string UserId, int PersonTelecomId);
        bool UpdatePost(PersonTelecomUpdateGet PersonTelecom);
    }
}