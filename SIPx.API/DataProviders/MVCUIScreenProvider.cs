
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
    public class MVCUIScreenProvider : IMVCUIScreenProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MVCUIScreenProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<MVCUIScreenIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_MVCUIScreenIndexGet @UserID";
            List<MVCUIScreenIndexGet> x = await _sqlDataAccess.LoadData<MVCUIScreenIndexGet, dynamic>(usp, new { UserId });
            return x;
        }
        public async Task<string> GetScreenId(string Controller, string Action)
        {
            string usp = "usp_MVCUIScreenGetScreenId @Controller, @Action";
            int x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { Controller, Action});
            return x.ToString();
        }
    }
}
