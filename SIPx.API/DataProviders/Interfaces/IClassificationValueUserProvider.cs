using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueUserProvider
    {
        Task<string> CreatePost(ClassificationValueUserCreateGet ClassificationValueUser);
        Task<string> CreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser);
        Task<ClassificationValueUserDeleteGet> DeleteGet(string UserId, int ClassificationValueUserId);
        bool DeletePost(int Id);
        Task<List<ClassificationValueUserIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueUserUpdateGet> UpdateGet(string UserId, int ClassificationValueUserId);
        bool UpdatePost(ClassificationValueUserUpdateGet ClassificationValueUser);
    }
}