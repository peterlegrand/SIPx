
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
    public class ProcessTypeFieldStageProvider : IProcessTypeFieldStageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFieldStageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTypeFieldStageIndexGetStages>> IndexGet(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldStageIndexGet @UserId, @ProcessTypeFieldId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldStageIndexGetStages, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldId = ProcessTypeFieldId });

        }

        public Task<ProcessTypeFieldStageUpdateGet> UpdateGet(string UserId, int ProcessTypeStageFieldID)
        {
            string usp = "usp_ProcessTypeFieldStageUpdateGet @UserId, @ProcessTypeStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFieldStageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageFieldID = ProcessTypeStageFieldID });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage)
        {
            string usp = "usp_ProcessTypeStageFieldUpdatePostCheck @ProcessTypeStageFieldId, @ProcessTypeStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFieldStage);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage)
        {
            string usp = "usp_ProcessTypeStageFieldUpdatePost @ProcessTypeStageFieldId, @ProcessTypeStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTypeFieldStageUpdateGet>(usp, ProcessTypeFieldStage);
            return true;
        }

        //public Task<List<ProcessTypeFieldList>> Sequence(string UserId, int ProcessTypeId, int ProcessTypeStageId)
        //{
        //    string usp = "usp_ProcessTypeFieldList @UserId, @ProcessTypeId, @ProcessTypeStageId ";
        //    return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId , ProcessTypeStageId = ProcessTypeStageId });

        //}
    }
}
