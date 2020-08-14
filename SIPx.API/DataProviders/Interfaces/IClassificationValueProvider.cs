using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueProvider
    {
        Task<string> ClassificationValueCreatePost(ClassificationValueCreatePost ClassificationValue);
        Task<string> ClassificationValueCreatePostCheck(ClassificationValueCreatePost ClassificationValue);
        Task<List<ClassificationValueUpdateGet>> ClassificationValueIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationValueLanguageIndexGet>> ClassificationValueLanguageIndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValueLanguageIndexGet> ClassificationValueLanguageUpdateGet(string UserId, int ClassificationValueLanguageId);
        Task<string> ClassificationValueRoleCreatePost(ClassificationValueRoleCreatePost ClassificationValueRole);
        Task<string> ClassificationValueRoleCreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole);
        Task<List<ClassificationValueRoleUpdateGet>> ClassificationValueRoleIndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueRoleUpdateGet> ClassificationValueRoleUpdateGet(string UserId, int ClassificationValueRoleId);
        Task<ClassificationValueUpdateGet> ClassificationValueUpdateGet(string UserId, int ClassificationValueId);
        Task<string> ClassificationValueUserCreatePost(ClassificationValueUserCreatePost ClassificationValueUser);
        Task<string> ClassificationValueUserCreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser);
        Task<List<ClassificationValueUserUpdateGet>> ClassificationValueUserIndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueUserUpdateGet> ClassificationValueUserUpdateGet(string UserId, int ClassificationValueUserId);
    }
}