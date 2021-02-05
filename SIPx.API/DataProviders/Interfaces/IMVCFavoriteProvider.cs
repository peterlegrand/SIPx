using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMVCFavoriteProvider
    {
        Task<bool> Add(MVCFavoriteAdd Favorite);
        Task<bool> GroupAdd(MVCFavoriteGroupAdd FavoriteGroup);
        Task<List<MVCFavoriteView>> ViewGet(string UserId, int? MVCFavoriteGroupId);
        Task<List<MVCFavoriteGroupView>> ViewGetGroup(string UserId);
        Task<List<MVCFavoriteMenu>> Menu(string UserId);
        Task<List<MVCFavoriteGroupList>> GroupList(string UserId);
    }
}