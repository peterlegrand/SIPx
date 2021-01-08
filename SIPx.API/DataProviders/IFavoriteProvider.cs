using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFavoriteProvider
    {
        Task<bool> Add(FavoritesAdd Favorite);
    }
}