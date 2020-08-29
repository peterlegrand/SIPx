
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
    public class DateLevelProvider : IDateLevelProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public DateLevelProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<DateLevelList>> List(string UserId)
        {
            string usp = "usp_DateLevelList @UserID";
            var x = await _sqlDataAccess.LoadData<DateLevelList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
