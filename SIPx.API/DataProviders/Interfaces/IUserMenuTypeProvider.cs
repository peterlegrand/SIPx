using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTypeProvider
    {
        Task<List<UserMenuTypeList>> LeftList(string UserId);
        Task<List<UserMenuTypeList>> RightList(string UserId);
    }
}