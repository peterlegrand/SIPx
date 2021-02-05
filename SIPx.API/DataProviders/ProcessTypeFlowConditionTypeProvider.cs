
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
    public class ProcessTypeFlowConditionTypeProvider : IProcessTypeFlowConditionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowConditionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTypeFlowConditionType>> ProcessTypeFlowConditionTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTypeFlowConditionTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTypeFlowConditionType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTypeFlowConditionType> ProcessTypeFlowConditionTypeUpdateGet(string UserId, int ProcessTypeFlowConditionTypeId)
        //{
        //    string usp = "usp_ProcessTypeFlowConditionTypeUpdateGet @UserId, @ProcessTypeFlowConditionTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowConditionType, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowConditionTypeId = ProcessTypeFlowConditionTypeId });

        //}
        public Task<List<ProcessTypeFlowConditionTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeFlowConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeFlowConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
