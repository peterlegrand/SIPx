
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
    public class ProcessTypeFlowConditionComparisonOperatorProvider : IProcessTypeFlowConditionComparisonOperatorProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowConditionComparisonOperatorProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTypeFlowConditionComparisonOperator>> IndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTypeFlowConditionComparisonOperatorIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTypeFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTypeFlowConditionComparisonOperator> ProcessTypeFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTypeFlowConditionComparisonOperatorId)
        //{
        //    string usp = "usp_ProcessTypeFlowConditionComparisonOperatorUpdateGet @UserId, @ProcessTypeFlowConditionComparisonOperatorID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowConditionComparisonOperatorId = ProcessTypeFlowConditionComparisonOperatorId });

        //}

        public Task<List<ProcessTypeFlowConditionComparisonOperatorList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeFlowConditionComparisonOperatorList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeFlowConditionComparisonOperatorList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
