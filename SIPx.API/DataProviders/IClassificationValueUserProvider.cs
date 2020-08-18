using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueUserProvider
    {
        Task<string> CreatePost(ClassificationValueUserCreatePost ClassificationValueUser);
        Task<string> CreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser);
        Task<List<ClassificationValueUserUpdateGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueUserUpdateGet> UpdateGet(string UserId, int ClassificationValueUserId);
    }
}