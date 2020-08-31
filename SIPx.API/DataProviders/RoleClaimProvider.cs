
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class RoleClaimProvider : IRoleClaimProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public RoleClaimProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public async Task<string> CreatePost(RoleClaimCreateGet RoleClaim)
        {
            string usp = "usp_RoleClaimCreatePost @Salutation, @FirstName, @MiddleName, @LastName, @RoleClaimalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, RoleClaim);
            return CheckString;
        }

        public Task<List<RoleClaimIndexGet>> IndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimIndexGet @UserID, @RoleId";
            return _sqlDataAccess.LoadData<RoleClaimIndexGet, dynamic>(usp, new { UserId = UserId , RoleId = RoleId });

        }

        public Task<RoleClaimUpdateGet> UpdateGet(string UserId, int RoleClaimId)
        {
            string usp = "usp_RoleClaimUpdateGet @UserId, @RoleClaimID";
            return _sqlDataAccess.LoadSingleRecord<RoleClaimUpdateGet, dynamic>(usp, new { UserId = UserId, RoleClaimId = RoleClaimId });
        }

        public bool UpdatePost(RoleClaimUpdateGet RoleClaim)
        {
            string usp = "usp_RoleClaimUpdatePost @RoleClaimId , @Salutation, @FirstName, @MiddleName, @LastName, @RoleClaimalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @ModifierId";
            _sqlDataAccess.SaveData<RoleClaimUpdateGet>(usp, RoleClaim);
            return true;
        }

        public Task<RoleClaimDeleteGet> DeleteGet(string UserId, int RoleClaimId)
        {
            string usp = "usp_RoleClaimDeleteGet @UserId, @RoleClaimID";
            return _sqlDataAccess.LoadSingleRecord<RoleClaimDeleteGet, dynamic>(usp, new { UserId, RoleClaimId });

        }

        public bool DeletePost(int RoleClaimId)
        {
            string usp = "usp_RoleClaimDeletePost @RoleClaimId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { RoleClaimId = RoleClaimId });
            return true;
        }

    }
}
