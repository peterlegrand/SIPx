using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonAddressProvider
    {
        Task<string> CreatePost(PersonAddressCreatePost PersonAddress);
        Task<List<ErrorMessage>> CreatePostCheck(PersonAddressCreateGet PersonAddress);
        Task<PersonAddressDeleteGet> DeleteGet(string UserId, int PersonAddressId);
        bool DeletePost(int Id);
        Task<List<PersonAddressIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonAddressUpdateGet> UpdateGet(string UserId, int PersonAddressId);
        bool UpdatePost(PersonAddressUpdateGet PersonAddress);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonAddressUpdateGet PersonAddress);
    }
}