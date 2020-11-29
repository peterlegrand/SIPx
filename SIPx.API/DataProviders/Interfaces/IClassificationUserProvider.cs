using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationUserProvider
    {
        Task<string> CreatePost(ClassificationUserCreateGet ClassificationUser);
        Task<string> CreatePostCheck(ClassificationUserCreateGet ClassificationUser);
        Task<ClassificationUserDeleteGet> DeleteGet(string UserId, int ClassificationUserId);
        bool DeletePost(int Id);
        Task<List<ClassificationUserIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationUserUpdateGet> UpdateGet(string UserId, int ClassificationUserId);
        bool UpdatePost(ClassificationUserUpdateGet ClassificationUser);
    }
}