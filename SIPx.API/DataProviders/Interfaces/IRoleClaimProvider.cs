using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleClaimProvider
    {
        Task<List<ErrorMessage>> CreatePostCheck(RoleClaimCreateGet RoleClaim);
        bool CreatePost(RoleClaimCreateGet RoleClaim);
        Task<RoleClaimDeleteGet> DeleteGet(string UserId, int RoleClaimId);
        bool DeletePost(int RoleClaimId);
        Task<List<RoleClaimIndexGet>> IndexGet(string UserId, string RoleId);
        //Task<RoleClaimUpdateGet> UpdateGet(string UserId, int RoleClaimId);
        //bool UpdatePost(RoleClaimUpdateGet RoleClaim);
        Task<RoleClaimCreateGet> CreateGet(string UserId, string RoleId);
        Task<List<ClaimList>> CreateGetClaimList(string UserId, string RoleId);
    }
}