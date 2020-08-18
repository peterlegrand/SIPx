using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueRoleProvider
    {
        Task<string> CreatePost(ClassificationValueRoleCreatePost ClassificationValueRole);
        Task<string> CreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole);
        Task<List<ClassificationValueRoleUpdateGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueRoleUpdateGet> UpdateGet(string UserId, int ClassificationValueRoleId);
    }
}