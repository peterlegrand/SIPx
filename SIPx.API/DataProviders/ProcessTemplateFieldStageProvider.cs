
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
    public class ProcessTemplateFieldStageProvider : IProcessTemplateFieldStageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFieldStageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFieldStageIndexGetStages>> IndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldStageIndexGet @UserId, @ProcessTemplateFieldId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldStageIndexGetStages, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }

        public Task<ProcessTemplateFieldStageUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldID)
        {
            string usp = "usp_ProcessTemplateFieldStageUpdateGet @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldStageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldID = ProcessTemplateStageFieldID });

        }

        public bool UpdatePost(ProcessTemplateFieldStageUpdateGet ProcessTemplateFieldStage)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdatePost @ProcessTemplateStageFieldId, @ProcessTemplateStageFieldStatusId, @ValueUpdateTypeId,@Sequence, @StringValue, @IntValue, @DateTimeValue, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTemplateFieldStageUpdateGet>(usp, ProcessTemplateFieldStage);
            return true;
        }

        //public Task<List<ProcessTemplateFieldList>> Sequence(string UserId, int ProcessTemplateId, int ProcessTemplateStageId)
        //{
        //    string usp = "usp_ProcessTemplateFieldList @UserId, @ProcessTemplateId, @ProcessTemplateStageId ";
        //    return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId , ProcessTemplateStageId = ProcessTemplateStageId });

        //}
    }
}
