using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuProvider
    {
        Task<List<SequenceList>> UserMenuCreateGetSequence(string UserId);
        bool UserMenuCreatePost(UserMenuCreateGet UserMenu);
        Task<UserMenuDeleteGet> UserMenuDeleteGet(string UserID, int UserMenuID);
        Task<List<UserMenuIndexGet>> UserMenuIndexGet(string UserId);
        Task<UserMenuUpdateGet> UserMenuUpdateGet(int UserMenuID);
        bool UserMenuUpdatePost(int UserMenuId);
        bool UserMenuUpdatePost(UserMenuUpdateGet UserMenu); 
        bool UserMenuDeletePost(UserMenuDeleteGet UserMenu);
    }
}