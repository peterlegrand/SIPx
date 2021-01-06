using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPositionProvider
    {
        bool CreatePost(PositionCreateGet Position);
        Task<List<ErrorMessage>> CreatePostCheck(PositionCreateGet Position);
        Task<PositionDeleteGet> DeleteGet(string UserId, int PositionId);
        bool DeletePost(string UserId, int PositionId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PositionId);
        Task<List<PositionIndexGet>> IndexGet(string UserId);
        Task<List<PositionLanguageUpdateGet>> LanguageIndexGet(string UserId, int PositionId);
        Task<PositionLanguageIndexGet> LanguageUpdateGet(string UserId, int PositionLanguageId);
        Task<List<PositionList>> List(string UserId);
        Task<PositionUpdateGet> UpdateGet(string UserId, int PositionId);
        bool UpdatePost(PositionUpdateGet Position);
        Task<List<ErrorMessage>> UpdatePostCheck(PositionUpdateGet Position);
    }
}

