
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
    public class UserProvider : IUserProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<UserIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_UserIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UserIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<UserUpdateGet> UpdateGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserUpdateGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<UserUpdateGet, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }

        public Task<List<UserList>> List()
        {
            string usp = "usp_UserList";
            return _sqlDataAccess.LoadData<UserList>(usp);

        }
    }
}
