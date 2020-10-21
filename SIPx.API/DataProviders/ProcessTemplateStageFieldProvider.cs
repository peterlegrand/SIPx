
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
    public class ProcessTemplateStageFieldProvider : IProcessTemplateStageFieldProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateStageFieldProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateStageFieldIndexGetFields>> IndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageFieldIndexGet @UserId, @ProcessTemplateStageId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldIndexGetFields, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }

        public Task<ProcessTemplateStageFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldID)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdateGet @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldID = ProcessTemplateStageFieldID });

        }

        public bool UpdatePost(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdatePost @ProcessTemplateStageFieldId, @ProcessTemplateStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateStageFieldUpdateGet>(usp, ProcessTemplateStageField);
            return true;
        }

        public Task<List<ProcessTemplateFieldList>> Sequence(string UserId, int ProcessTemplateId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateFieldList @UserId, @ProcessTemplateId, @ProcessTemplateStageId ";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId , ProcessTemplateStageId = ProcessTemplateStageId });

        }
    }
}
