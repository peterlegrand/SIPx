using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserProvider
    {
        Task<List<UserIndexGet>> IndexGet(string UserId);
        Task<List<UserList>> List();
        Task<UserUpdateGet> UpdateGet(string UserId, string SelectedUserId);
    }
}