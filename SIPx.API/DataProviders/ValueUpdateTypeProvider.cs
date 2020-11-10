
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
    public class ValueUpdateTypeProvider : IValueUpdateTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ValueUpdateTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTemplateStageFieldStatus>> IndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatusIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTemplateStageFieldStatus> ProcessTemplateStageFieldStatuIndexGet(string UserId, int ProcessTemplateStageFieldStatusId)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatus @UserId, @ProcessTemplateStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldStatusId = ProcessTemplateStageFieldStatusId });

        //}
        //public Task<ProcessTemplateStageFieldStatusUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldDStatusId)
        //{
        //    string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageFieldDStatusId";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatusUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldDStatusId = ProcessTemplateStageFieldDStatusId });
        //}
        public Task<List<ValueUpdateTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatusList @UserID";
            return _sqlDataAccess.LoadData<ValueUpdateTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
