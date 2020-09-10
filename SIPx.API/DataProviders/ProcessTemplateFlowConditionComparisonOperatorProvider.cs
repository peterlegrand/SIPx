
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
    public class ProcessTemplateFlowConditionComparisonOperatorProvider : IProcessTemplateFlowConditionComparisonOperatorProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowConditionComparisonOperatorProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTemplateFlowConditionComparisonOperator>> IndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTemplateFlowConditionComparisonOperator> ProcessTemplateFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId)
        //{
        //    string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorUpdateGet @UserId, @ProcessTemplateFlowConditionComparisonOperatorID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionComparisonOperatorId = ProcessTemplateFlowConditionComparisonOperatorId });

        //}

        public Task<List<ProcessTemplateFlowConditionComparisonOperatorList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperatorList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
