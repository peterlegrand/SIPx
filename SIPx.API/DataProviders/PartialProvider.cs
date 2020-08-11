
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class PartialProvider : IPartialProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PartialProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PartialLeftUserMenu>> PartialLeftUserMenu(string UserId)
        {
            string usp = "[usp_PartialLeftUserMenu] @UserID";
            return _sqlDataAccess.LoadData<PartialLeftUserMenu, dynamic>(usp, new { UserId });
        }

    }
}
