
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
    public class SecurityLevelProvider : ISecurityLevelProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public SecurityLevelProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<SecurityLevelIndexGet>> SecurityLevelIndexGet(string UserId)
        {
            string usp = "usp_SecurityLevelIndexGet @UserID";
            return _sqlDataAccess.LoadData<SecurityLevelIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<SecurityLevelUpdateGet> SecurityLevelUpdateGet(string UserId, int SecurityLevelId)
        {
            string usp = "usp_SecurityLevelUpdateGet @UserId, @SecurityLevelID";
            return _sqlDataAccess.LoadSingleRecord<SecurityLevelUpdateGet, dynamic>(usp, new { UserId = UserId, SecurityLevelId = SecurityLevelId });
        }
        public async Task<List<SecurityLevelList>> SecurityLevelList(string UserId)
        {
            string usp = "usp_SecurityLevelList @UserID";
            var x = await _sqlDataAccess.LoadData<SecurityLevelList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
