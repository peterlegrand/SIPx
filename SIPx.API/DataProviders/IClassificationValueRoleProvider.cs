using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueRoleProvider
    {
        Task<ClassificationValueRoleCreateGetClassificationName> ClassificationValueRoleCreateGetClassificationName(string UserId, int ClassificationValueId);
        Task<string> CreatePost(ClassificationValueRoleCreateGet ClassificationValueRole);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationValueRoleCreateGet ClassificationValueRole);
        Task<ClassificationValueRoleDeleteGet> DeleteGet(string UserId, int ClassificationValueRoleId);
        bool DeletePost(string UserId, int ClassificationValueRoleId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationValueRoleId);
        Task<List<ClassificationValueRoleIndexGet>> IndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueRoleUpdateGet> UpdateGet(string UserId, int ClassificationValueRoleId);
        bool UpdatePost(ClassificationValueRoleUpdateGet ClassificationValueRole);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValueRoleUpdateGet ClassificationValueRole);
    }
}