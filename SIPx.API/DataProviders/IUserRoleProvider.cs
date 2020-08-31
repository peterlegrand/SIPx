using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserRoleProvider
    {
        Task<List<UserRoleIndexGet>> IndexGet(string UserId, string UserRoleUserId);
    }
}