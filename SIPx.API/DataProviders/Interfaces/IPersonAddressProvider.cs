using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonAddressProvider
    {
        Task<string> CreatePost(PersonAddressCreatePost PersonAddress);
        Task<string> CreatePostCheck(PersonAddressCreatePost PersonAddress);
        Task<List<PersonAddressIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonAddressUpdateGet> UpdateGet(string UserId, int PersonAddressId);
        bool UpdatePost(PersonAddressUpdateGet PersonAddress);
    }
}