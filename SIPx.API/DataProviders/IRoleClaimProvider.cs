using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleClaimProvider
    {
        Task<string> CreatePost(RoleClaimCreateGet RoleClaim);
        Task<RoleClaimDeleteGet> DeleteGet(string UserId, int RoleClaimId);
        bool DeletePost(int RoleClaimId);
        Task<List<RoleClaimIndexGet>> IndexGet(string UserId);
        Task<RoleClaimUpdateGet> UpdateGet(string UserId, int RoleClaimId);
        bool UpdatePost(RoleClaimUpdateGet RoleClaim);
    }
}