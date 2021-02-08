
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
    public class ObjectTypePropertyStatus : IObjectTypePropertyStatus
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ObjectTypePropertyStatus(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ObjectTypePropertyStatusList>> List(string UserId)
        {
            string usp = "usp_ObjectTypePropertyStatusList @UserID";
            var x = await _sqlDataAccess.LoadData<ObjectTypePropertyStatusList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
