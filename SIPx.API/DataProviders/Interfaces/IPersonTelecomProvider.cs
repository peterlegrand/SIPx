using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonTelecomProvider
    {
        Task<string> PersonTelecomCreatePost(PersonTelecomCreatePost PersonTelecom);
        Task<string> PersonTelecomCreatePostCheck(PersonTelecomCreatePost PersonTelecom);
        Task<List<PersonTelecomIndexGet>> PersonTelecomIndexGet(string UserId, int PersonId);
        Task<PersonTelecomUpdateGet> PersonTelecomUpdateGet(string UserId, int PersonTelecomId);
    }
}