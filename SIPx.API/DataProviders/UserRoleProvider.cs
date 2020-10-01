
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
    public class UserRoleProvider : IUserRoleProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserRoleProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<UserRoleIndexGet>> IndexGet(string UserId, string UserRoleUserId)
        {
            string usp = "usp_UserRoleIndexGet @UserId, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRoleIndexGet, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserRoleUserId });
            return x;
        }
        public async Task<List<string>> UserRoleIDsPerUser(string UserId)
        {
            string usp = "usp_UserRoleIDPerUser @UserId";
            var x = await _sqlDataAccess.LoadData<string, dynamic>(usp, UserId);
            return x;
        }
    }
}
