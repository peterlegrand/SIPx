using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleGroupProvider
    {
        Task<string> RoleGroupCreatePost(RoleGroupCreatePost RoleGroup);
        Task<string> RoleGroupCreatePostCheck(RoleGroupCreatePost RoleGroup);
        Task<List<RoleGroupIndexGet>> RoleGroupIndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId);
        Task<ObjectLanguageUpdateGet> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroupUpdateGet> RoleGroupUpdateGet(string UserId, int RoleGroupId);
    }
}