using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonAddressProvider
    {
        Task<string> PersonAddressCreatePost(PersonAddressCreatePost PersonAddress);
        Task<string> PersonAddressCreatePostCheck(PersonAddressCreatePost PersonAddress);
        Task<List<PersonAddressIndexGet>> PersonAddressIndexGet(string UserId, int PersonId);
        Task<PersonAddressUpdateGet> PersonAddressUpdateGet(string UserId, int PersonAddressId);
    }
}