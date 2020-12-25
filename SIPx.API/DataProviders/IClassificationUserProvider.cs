using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationUserProvider
    {
        Task<string> CreatePost(ClassificationUserCreateGet ClassificationUser);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationUserCreateGet ClassificationUser);
        Task<ClassificationUserDeleteGet> DeleteGet(string UserId, int ClassificationUserId);
        bool DeletePost(string UserId, int ClassificationUserId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationUserId);
        Task<List<ClassificationUserIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationUserUpdateGet> UpdateGet(string UserId, int ClassificationUserId);
        bool UpdatePost(ClassificationUserUpdateGet ClassificationUser);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationUserUpdateGet ClassificationUser);
    }
}