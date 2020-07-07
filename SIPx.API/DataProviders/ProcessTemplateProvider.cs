
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

        public Task<List<ProcessTemplateFieldLanguage>> GetProcessTemplateFieldLanguages(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldLanguages @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<ProcessTemplateFieldLanguage> GetProcessTemplateFieldLanguage(string UserId, int ProcessTemplateFieldLanguageId)
        {
            string usp = "usp_ProcessTemplateFieldLanguage @UserId, @ProcessTemplateFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldLanguageId = ProcessTemplateFieldLanguageId });

        }
        public Task<List<ProcessTemplateField>> GetProcessTemplateFields(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFields @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateField, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateField> GetProcessTemplateField(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateField @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateField, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateFlowConditionLanguage>> GetProcessTemplateFlowConditionLanguages(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguages @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<ProcessTemplateFlowConditionLanguage> GetProcessTemplateFlowConditionLanguage(string UserId, int ProcessTemplateFlowConditionLanguageId)
        {
            string usp = "usp_ProcessTemplateField @UserId, @ProcessTemplateFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionLanguageId = ProcessTemplateFlowConditionLanguageId });

        }
        public Task<List<ProcessTemplateFlowCondition>> GetProcessTemplateFlowConditions(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditions @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowCondition, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowCondition> GetProcessTemplateFlowCondition(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowCondition @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowCondition, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<List<ProcessTemplateFlowLanguage>> GetProcessTemplateFlowLanguages(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowLanguages @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowLanguage> GetProcessTemplateFlowLanguage(string UserId, int ProcessTemplateFlowLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowLanguage @UserId, @ProcessTemplateFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowLanguageId = ProcessTemplateFlowLanguageId });

        }
        public Task<List<ProcessTemplateFlow>> GetProcessTemplateFlows(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFlows @UserId, @ProcessTemplateD";
            return _sqlDataAccess.LoadData<ProcessTemplateFlow, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateFlow> GetProcessTemplateFlow(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlow @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlow, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<List<ProcessTemplateGroupLanguage>> GetProcessTemplateGroupLanguages(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupLanguages @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<ProcessTemplateGroupLanguage> GetProcessTemplateGroupLanguage(string UserId, int ProcessTemplateGroupLanguageId)
        {
            string usp = "usp_ProcessTemplateGroupLanguage @UserId, @ProcessTemplateGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupLanguageId = ProcessTemplateGroupLanguageId });

        }
        public Task<List<ProcessTemplateLanguage>> GetProcessTemplateLanguages(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateLanguages @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateLanguage> GetProcessTemplateLanguage(string UserId, int ProcessTemplateLanguageId)
        {
            string usp = "usp_ProcessTemplateLanguage @UserId, @ProcessTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateLanguageId = ProcessTemplateLanguageId });

        }
        public Task<List<ProcessTemplateStageField>> GetProcessTemplateStageFields(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageFields @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageField, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageField> GetProcessTemplateStageField(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateStageField @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageField, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }
        public Task<List<ProcessTemplateFieldStage>> GetProcessTemplateFieldStages(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldStages @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateStageFieldStatus>> GetProcessTemplateStageFieldStatuses(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatuses @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId });

        }
        //public Task<ProcessTemplateStageFieldStatus> GetProcessTemplateStageFieldStatus(string UserId, int ProcessTemplateStageFieldStatusId)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatus @UserId, @ProcessTemplateStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldStatusId = ProcessTemplateStageFieldStatusId });

        //}
        public Task<List<ProcessTemplateStageLanguage>> GetProcessTemplateStageLanguages(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageLanguage @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageLanguage> GetProcessTemplateStageLanguage(string UserId, int ProcessTemplateStageLanguageId)
        {
            string usp = "usp_ProcessTemplateStageLanguage @UserId, @ProcessTemplateStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageLanguageId = ProcessTemplateStageLanguageId });

        }
        public Task<List<ProcessTemplateStage>> GetProcessTemplateStages(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStage @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateStage> GetProcessTemplateStage(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStage @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<List<ProcessTemplateFieldType>> GetProcessTemplateFieldTypes(string UserId)
        {
            string usp = "usp_ProcessTemplateFieldTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFieldType> GetProcessTemplateFieldType(string UserId, int ProcessTemplateFieldTypeId)
        {
            string usp = "usp_ProcessTemplateFieldType @UserId, @ProcessTemplateFieldTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldTypeId = ProcessTemplateFieldTypeId });

        }
        public Task<List<ProcessTemplateFlowConditionComparisonOperator>> GetProcessTemplateFlowConditionComparisonOperators(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperators @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionComparisonOperator> GetProcessTemplateFlowConditionComparisonOperator(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperator @UserId, @ProcessTemplateFlowConditionComparisonOperatorID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionComparisonOperatorId = ProcessTemplateFlowConditionComparisonOperatorId });

        }
        public Task<List<ProcessTemplateFlowConditionType>> GetProcessTemplateFlowConditionTypes(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionType> GetProcessTemplateFlowConditionType(string UserId, int ProcessTemplateFlowConditionTypeId)
        {
            string usp = "usp_ProcessTemplateFlowConditionType @UserId, @ProcessTemplateFlowConditionTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionTypeId = ProcessTemplateFlowConditionTypeId });

        }
        public Task<List<ProcessTemplateGroup>> GetProcessTemplateGroups(string UserId)
        {
            string usp = "usp_ProcessTemplateGroups @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroup, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateGroup> GetProcessTemplateGroup(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroup @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroup, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<List<ProcessTemplate>> GetProcessTemplates(string UserId)
        {
            string usp = "usp_ProcessTemplates @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplate, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplate> GetProcessTemplate(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplate @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplate, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<List<ProcessTemplateStageType>> GetProcessTemplateStageTypes(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateStageType> GetProcessTemplateStageType(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageType @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<List<ProcessTemplateStageTypeLanguage>> GetProcessTemplateStageTypeLanguages(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguages @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<ProcessTemplateStageTypeLanguage> GetProcessTemplateStageTypeLanguage(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguage @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }
    }
}
