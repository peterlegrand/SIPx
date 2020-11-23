
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
    public class PropertyTypeProvider : IPropertyTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PropertyTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<PropertyTypeList>> List(string UserId)
        {
            string usp = "usp_PropertyTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<PropertyTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
