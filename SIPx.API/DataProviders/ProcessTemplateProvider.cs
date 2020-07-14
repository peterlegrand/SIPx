
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
    public class ProcessTemplateProvider : IProcessTemplateProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFieldLanguage>> ProcessTemplateFieldLanguageIndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageIndexGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<ProcessTemplateFieldLanguage> ProcessTemplateFieldLanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageUpdateGet @UserId, @ProcessTemplateFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldLanguageId = ProcessTemplateFieldLanguageId });

        }
        public Task<List<ProcessTemplateField>> ProcessTemplateFieldIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateField, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateField> ProcessTemplateFieldUpdateGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldUpdateGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateField, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateFlowConditionLanguage>> ProcessTemplateFlowConditionLanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageIndexGet @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<ProcessTemplateFlowConditionLanguage> ProcessTemplateFlowConditionLanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageUpdateGet @UserId, @ProcessTemplateFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionLanguageId = ProcessTemplateFlowConditionLanguageId });

        }
        public Task<List<ProcessTemplateFlowCondition>> ProcessTemplateFlowConditionIndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowCondition, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowCondition> ProcessTemplateFlowConditionUpdateGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditioUpdateGetn @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowCondition, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<List<ProcessTemplateFlowLanguage>> ProcessTemplateFlowLanguageIndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowLanguage> ProcessTemplateFlowLanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageUpdateGet @UserId, @ProcessTemplateFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowLanguageId = ProcessTemplateFlowLanguageId });

        }
        public Task<List<ProcessTemplateFlow>> ProcessTemplateFlowIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFlowIndexGet @UserId, @ProcessTemplateD";
            return _sqlDataAccess.LoadData<ProcessTemplateFlow, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateFlow> ProcessTemplateFlowUpdateGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlow, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<List<ProcessTemplateGroupLanguage>> ProcessTemplateGroupLanguageIndexGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageIndexGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<ProcessTemplateGroupLanguage> ProcessTemplateGroupLanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageUpdateGet @UserId, @ProcessTemplateGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupLanguageId = ProcessTemplateGroupLanguageId });

        }
        public Task<List<ProcessTemplateLanguage>> ProcessTemplateLanguageIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateLanguageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateLanguage> ProcessTemplateLanguageUpdateGet(string UserId, int ProcessTemplateLanguageId)
        {
            string usp = "usp_ProcessTemplateLanguageUpdateGet @UserId, @ProcessTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateLanguageId = ProcessTemplateLanguageId });

        }
        public Task<List<ProcessTemplateStageField>> ProcessTemplateStageFieldIndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageFieldIndexGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageField, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageField> ProcessTemplateStageFieldUpdateGet(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdateGet @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageField, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }
        public Task<List<ProcessTemplateFieldStage>> ProcessTemplateFieldStageIndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldStageIndexGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatusIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatusIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId });

        }
        //public Task<ProcessTemplateStageFieldStatus> ProcessTemplateStageFieldStatuIndexGet(string UserId, int ProcessTemplateStageFieldStatusId)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatus @UserId, @ProcessTemplateStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldStatusId = ProcessTemplateStageFieldStatusId });

        //}
        public Task<List<ProcessTemplateStageLanguage>> ProcessTemplateStageLanguageIndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageLanguage @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageLanguage> ProcessTemplateStageLanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId)
        {
            string usp = "usp_ProcessTemplateStageLanguageUpdateGet @UserId, @ProcessTemplateStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageLanguageId = ProcessTemplateStageLanguageId });

        }
        public Task<List<ProcessTemplateStage>> ProcessTemplateStageIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateStage> ProcessTemplateStageUpdateGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageUpdateGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<List<ProcessTemplateFieldType>> ProcessTemplateFieldTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFieldTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFieldType> ProcessTemplateFieldTypeUpdateGet(string UserId, int ProcessTemplateFieldTypeId)
        {
            string usp = "usp_ProcessTemplateFieldTypeUpdateGet @UserId, @ProcessTemplateFieldTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldTypeId = ProcessTemplateFieldTypeId });

        }
        public Task<List<ProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperatorIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionComparisonOperator> ProcessTemplateFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorUpdateGet @UserId, @ProcessTemplateFlowConditionComparisonOperatorID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionComparisonOperatorId = ProcessTemplateFlowConditionComparisonOperatorId });

        }
        public Task<List<ProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionType> ProcessTemplateFlowConditionTypeUpdateGet(string UserId, int ProcessTemplateFlowConditionTypeId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeUpdateGet @UserId, @ProcessTemplateFlowConditionTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionTypeId = ProcessTemplateFlowConditionTypeId });

        }
        public Task<List<ProcessTemplateGroup>> ProcessTemplateGroupIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroup, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateGroup> ProcessTemplateGroupUpdateGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupUpdateGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroup, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<List<ProcessTemplate>> ProcessTemplateIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplate, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplate> ProcessTemplateUpdateGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateUpdateGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplate, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdateGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageIndexGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }
    }
}
