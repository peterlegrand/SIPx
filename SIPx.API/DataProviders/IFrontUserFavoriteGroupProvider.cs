using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontUserFavoriteGroupProvider
    {
        Task<List<MVCFavoriteGroupList>> List(string UserId);
    }
}