
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
    public class ProcessTypeStageFieldProvider : IProcessTypeStageFieldProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeStageFieldProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTypeStageFieldIndexGetFields>> IndexGet(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageFieldIndexGet @UserId, @ProcessTypeStageId";
            return _sqlDataAccess.LoadData<ProcessTypeStageFieldIndexGetFields, dynamic>(usp, new { UserId = UserId, ProcessTypeStageId = ProcessTypeStageId });

        }

        public Task<ProcessTypeStageFieldUpdateGet> UpdateGet(string UserId, int ProcessTypeStageFieldID)
        {
            string usp = "usp_ProcessTypeStageFieldUpdateGet @UserId, @ProcessTypeStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageFieldID = ProcessTypeStageFieldID });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageFieldUpdateGet ProcessTypeStageField)
        {
            string usp = "usp_ProcessTypeStageFieldUpdatePostCheck @ProcessTypeStageFieldId, @ProcessTypeStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeStageField);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeStageFieldUpdateGet ProcessTypeStageField)
        {
            string usp = "usp_ProcessTypeStageFieldUpdatePost @ProcessTypeStageFieldId, @ProcessTypeStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeStageFieldUpdateGet>(usp, ProcessTypeStageField);
            return true;
        }

        public Task<List<SequenceList>> Sequence(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageFieldUpdateGetSequence @UserId, @ProcessTypeStageId ";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId, ProcessTypeStageId = ProcessTypeStageId });

        }
    }
}
