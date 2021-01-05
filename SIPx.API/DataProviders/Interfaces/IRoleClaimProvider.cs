using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleClaimProvider
    {
        Task<RoleClaimCreateGet> CreateGet(string UserId, string RoleId);
        Task<List<ClaimList>> CreateGetClaimList(string UserId, string RoleId);
        bool CreatePost(RoleClaimCreateGet RoleClaim);
        Task<List<ErrorMessage>> CreatePostCheck(RoleClaimCreateGet RoleClaim);
        Task<RoleClaimDeleteGet> DeleteGet(string UserId, int RoleClaimId);
        bool DeletePost(string UserId, int RoleClaimId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int RoleClaimId);
        Task<List<RoleClaimIndexGet>> IndexGet(string UserId, string RoleId);
    }
}