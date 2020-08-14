
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


        public async Task<List<UserRoleIndexGet>> UserRoleIndexGet(string UserId, string UserRoleUserId)
        {
            string usp = "usp_UserRoleIndexGet @UserId, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRoleIndexGet, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserRoleUserId });
            return x;
        }
        public async Task<List<UserIndexGet>> UserIndexGet(string UserId)
        {
            string usp = "usp_UserIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UserIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UserUpdateGet> UserUpdateGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserUpdateGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<UserUpdateGet, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public Task<List<UserMenuTypeList>> UserMenuTypeRightList(string UserId)
        {
            string usp = "usp_UserMenuTypeRightList @UserID";
            return _sqlDataAccess.LoadData<UserMenuTypeList, dynamic>(usp, new { UserId = UserId });
        }
        public Task<List<UserMenuTypeList>> UserMenuTypeLeftList(string UserId)
        {
            string usp = "usp_UserMenuTypeLeftList @UserID";
            return _sqlDataAccess.LoadData<UserMenuTypeList, dynamic>(usp, new { UserId = UserId });
        }

        public Task<List<UserList>> UserList()
        {
            string usp = "usp_UserList";
            return _sqlDataAccess.LoadData<UserList>(usp);

        }
    }
}
