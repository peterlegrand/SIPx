using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleProvider
    {
        Task<List<RoleClaimIndexGet>> RoleClaimIndexGet(string UserId, string RoleId);
        Task<List<RoleIndexGet>> RoleIndexGet(string UserId);
        Task<List<RoleLanguageIndexGet>> RoleLanguageIndexGet(string UserId, string RoleId);
        Task<RoleLanguageUpdateGet> RoleLanguageUpdateGet(string UserId, int RoleLanguageId);
        Task<List<RoleList>> RoleList(string UserId);
        Task<RoleUpdateGet> RoleUpdateGet(string UserId, string RoleId);
    }
}