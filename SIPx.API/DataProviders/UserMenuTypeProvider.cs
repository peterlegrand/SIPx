
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
    public class UserMenuTypeProvider : IUserMenuTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserMenuTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<UserMenuTypeList>> RightList(string UserId)
        {
            string usp = "usp_UserMenuTypeRightList @UserID";
            return _sqlDataAccess.LoadData<UserMenuTypeList, dynamic>(usp, new { UserId = UserId });
        }

        public Task<List<UserMenuTypeList>> LeftList(string UserId)
        {
            string usp = "usp_UserMenuTypeLeftList @UserID";
            return _sqlDataAccess.LoadData<UserMenuTypeList, dynamic>(usp, new { UserId = UserId });
        }

    }
}
