
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
    public class CodeTypeProvider : ICodeTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public CodeTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<CodeTypeList>> List(string UserId)
        {
            string usp = "usp_CodeTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<CodeTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
