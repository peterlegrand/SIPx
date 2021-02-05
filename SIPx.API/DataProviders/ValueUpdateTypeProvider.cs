
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

        //public Task<List<ProcessTypeStageFieldStatus>> IndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTypeStageFieldStatusIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTypeStageFieldStatus, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTypeStageFieldStatus> ProcessTypeStageFieldStatuIndexGet(string UserId, int ProcessTypeStageFieldStatusId)
        //{
        //    string usp = "usp_ProcessTypeStageFieldStatus @UserId, @ProcessTypeStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageFieldStatus, dynamic>(usp, new { UserId = UserId, ProcessTypeStageFieldStatusId = ProcessTypeStageFieldStatusId });

        //}
        //public Task<ProcessTypeStageFieldStatusUpdateGet> UpdateGet(string UserId, int ProcessTypeStageFieldDStatusId)
        //{
        //    string usp = "usp_ProcessTypeStageTypeLanguageUpdateGet @UserId, @ProcessTypeStageFieldDStatusId";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageFieldStatusUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageFieldDStatusId = ProcessTypeStageFieldDStatusId });
        //}
        public Task<List<ValueUpdateTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeStageFieldStatusList @UserID";
            return _sqlDataAccess.LoadData<ValueUpdateTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
