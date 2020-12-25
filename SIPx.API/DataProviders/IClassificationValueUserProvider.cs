using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueUserProvider
    {
        Task<string> CreatePost(ClassificationValueUserCreateGet ClassificationValueUser);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationValueUserCreateGet ClassificationValueUser);
        Task<ClassificationValueUserDeleteGet> DeleteGet(string UserId, int ClassificationValueUserId);
        bool DeletePost(string UserId, int ClassificationValueUserId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationValueUserId);
        Task<List<ClassificationValueUserIndexGet>> IndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueUserUpdateGet> UpdateGet(string UserId, int ClassificationValueUserId);
        bool UpdatePost(ClassificationValueUserUpdateGet ClassificationValueUser);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValueUserUpdateGet ClassificationValueUser);
    }
}