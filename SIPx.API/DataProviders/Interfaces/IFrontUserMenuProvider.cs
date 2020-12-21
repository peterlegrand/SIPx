using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontUserMenuProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<UserMenuDeleteGet> DeleteGet(string UserID, int UserMenuID);
        bool DeletePost(UserMenuDeleteGet UserMenu);
        Task<List<UserMenuIndexGet>> IndexGet(string UserId);
        Task<UserMenuUpdateGet> UpdateGet(int UserMenuID);
        bool UpdatePost(UserMenuUpdateGet UserMenu);
        bool CreatePost(UserMenuCreateGet UserMenu);
    }
}