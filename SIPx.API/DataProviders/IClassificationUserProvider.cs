using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationUserProvider
    {
        Task<string> CreatePost(ClassificationUserCreatePost ClassificationUser);
        Task<List<ClassificationUserIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<string> CreatePostCheck(ClassificationUserCreatePost ClassificationUser);
        Task<ClassificationUserUpdateGet> UpdateGet(string UserId, int ClassificationUserId);
    }
}