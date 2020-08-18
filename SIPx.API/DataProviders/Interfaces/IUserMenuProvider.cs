using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<UserMenuDeleteGet> DeleteGet(string UserID, int UserMenuID);
        bool DeletePost(UserMenuDeleteGet UserMenu);
        Task<List<UserMenuIndexGet>> IndexGet(string UserId);
        Task<UserMenuUpdateGet> UpdateGet(int UserMenuID);
        bool UpdatePost(int UserMenuId);
        bool UpdatePost(UserMenuUpdateGet UserMenu);
        bool UserMenuCreatePost(UserMenuCreateGet UserMenu);
    }
}