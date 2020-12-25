
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
    public class ProcessTemplateFlowPassComparisonOperatorProvider : IProcessTemplateFlowPassComparisonOperatorProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowPassComparisonOperatorProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFlowPassComparisonOperatorList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowPassComparisonOperatorList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowPassComparisonOperatorList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
