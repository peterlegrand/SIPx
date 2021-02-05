
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
    public class ProcessTypeFlowPassComparisonOperatorProvider : IProcessTypeFlowPassComparisonOperatorProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowPassComparisonOperatorProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTypeFlowPassComparisonOperatorList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeFlowPassComparisonOperatorList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeFlowPassComparisonOperatorList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
