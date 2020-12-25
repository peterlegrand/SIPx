using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationRoleProvider
    {
        bool CreatePost(ClassificationRoleCreateGet ClassificationRole);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationRoleCreateGet ClassificationRole);
        Task<ClassificationRoleDeleteGet> DeleteGet(string UserId, int ClassificationRoleId);
        bool DeletePost(string UserId, int ClassificationRoleId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationRoleId);
        Task<List<ClassificationRoleIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationRoleUpdateGet> UpdateGet(string UserId, int ClassificationRoleId);
        bool UpdatePost(ClassificationRoleUpdateGet ClassificationRole);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationRoleUpdateGet ClassificationRole);
    }
}