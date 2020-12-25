using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonTelecomProvider
    {
        Task<string> CreatePost(PersonTelecomCreateGet PersonTelecom);
        Task<List<ErrorMessage>> CreatePostCheck(PersonTelecomCreateGet PersonTelecom);
        Task<PersonTelecomDeleteGet> DeleteGet(string UserId, int PersonTelecomId);
        bool DeletePost(string UserId, int PersonTelecomId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTelecomId);
        Task<List<PersonTelecomIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonTelecomUpdateGet> UpdateGet(string UserId, int PersonTelecomId);
        bool UpdatePost(PersonTelecomUpdateGet PersonTelecom);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonTelecomUpdateGet PersonTelecom);
    }
}