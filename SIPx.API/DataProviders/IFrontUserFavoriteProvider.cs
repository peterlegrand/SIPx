using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontUserFavoriteProvider
    {
        Task<MVCFavoriteDeleteGet> DeleteGet(string UserId, int MVCFavoriteId);
        bool DeletePost(string UserId, int MVCFavoriteId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int MVCFavoriteId);
        Task<List<MVCFavoriteIndexGet>> IndexGet(string UserId);
        Task<MVCFavoriteUpdateGet> UpdateGet(string UserId, int MVCFavoriteId);
        Task<bool> UpdatePost(MVCFavoriteUpdateGet Favorite);
        Task<List<ErrorMessage>> UpdatePostCheck(MVCFavoriteUpdateGet Favorite);
        Task<List<SequenceList>> UpdateGetSequence(string UserId, int MVCFavoriteGroupId);
    }
}