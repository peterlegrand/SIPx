
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
    public class PropertyStatusProvider : IPropertyStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PropertyStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<PropertyStatusList>> List(string UserId)
        {
            string usp = "usp_PropertyStatusList @UserID";
            return _sqlDataAccess.LoadData<PropertyStatusList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
