
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
    public class ProcessTemplateFlowPassTypeProvider : IProcessTemplateFlowPassTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowPassTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTemplateFlowPassType>> ProcessTemplateFlowPassTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTemplateFlowPassTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTemplateFlowPassType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTemplateFlowPassType> ProcessTemplateFlowPassTypeUpdateGet(string UserId, int ProcessTemplateFlowPassTypeId)
        //{
        //    string usp = "usp_ProcessTemplateFlowPassTypeUpdateGet @UserId, @ProcessTemplateFlowPassTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowPassType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowPassTypeId = ProcessTemplateFlowPassTypeId });

        //}
        public Task<List<ProcessTemplateFlowPassTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowPassTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowPassTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
