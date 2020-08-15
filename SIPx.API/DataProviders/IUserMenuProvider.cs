using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuProvider
    {
        Task<List<SequenceList>> UserMenuCreateGetSequence(string UserId);
        bool UserMenuCreatePost(UserMenuCreateGet UserMenu);
        Task<List<UserMenuIndexGet>> UserMenuIndexGet(string UserId);
        Task<UserMenuUpdateGet> UserMenuUpdateGet(int UserMenuID);
        bool UserMenuUpdatePost(UserMenuUpdateGet UserMenu);
    }
}