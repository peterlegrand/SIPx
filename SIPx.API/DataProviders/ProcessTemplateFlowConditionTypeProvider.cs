
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
    public class ProcessTemplateFlowConditionTypeProvider : IProcessTemplateFlowConditionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowConditionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTemplateFlowConditionTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTemplateFlowConditionType> ProcessTemplateFlowConditionTypeUpdateGet(string UserId, int ProcessTemplateFlowConditionTypeId)
        //{
        //    string usp = "usp_ProcessTemplateFlowConditionTypeUpdateGet @UserId, @ProcessTemplateFlowConditionTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionTypeId = ProcessTemplateFlowConditionTypeId });

        //}
        public Task<List<ProcessTemplateFlowConditionTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
