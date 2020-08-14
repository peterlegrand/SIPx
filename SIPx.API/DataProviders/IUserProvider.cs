using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserProvider
    {
        Task<List<UserIndexGet>> UserIndexGet(string UserId);
        Task<List<UserList>> UserList();
        Task<List<UserMenuTypeList>> UserMenuTypeLeftList(string UserId);
        Task<List<UserMenuTypeList>> UserMenuTypeRightList(string UserId);
        Task<List<UserRoleIndexGet>> UserRoleIndexGet(string UserId, string UserRoleUserId);
        Task<UserUpdateGet> UserUpdateGet(string UserId, string SelectedUserId);
    }
}