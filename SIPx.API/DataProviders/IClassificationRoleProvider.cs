using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationRoleProvider
    {
        bool CreatePost(ClassificationRoleCreatePost ClassificationRole);
        Task<string> CreatePostCheck(ClassificationRoleCreatePost ClassificationRole);
        Task<List<ClassificationRoleIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationRoleUpdateGet> UpdateGet(string UserId, int ClassificationRoleId);
    }
}