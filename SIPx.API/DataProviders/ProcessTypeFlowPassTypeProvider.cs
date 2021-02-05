
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
    public class ProcessTypeFlowPassTypeProvider : IProcessTypeFlowPassTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowPassTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTypeFlowPassTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeFlowPassTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeFlowPassTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
