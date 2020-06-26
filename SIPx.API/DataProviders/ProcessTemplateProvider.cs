
using Dapper;
using SIPx.API.ViewModels;
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

        public Task<List<ProcessTemplateFieldLanguage>> GetProcessTemplateFieldLanguages(string UserID, int ProcessTemplateFieldID)
        {
            string usp = "usp_ProcessTemplateFieldLanguages @UserID, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFieldID = ProcessTemplateFieldID });

        }
        public Task<ProcessTemplateFieldLanguage> GetProcessTemplateFieldLanguage(string UserID, int ProcessTemplateFieldLanguageID)
        {
            string usp = "usp_ProcessTemplateFieldLanguage @UserID, @ProcessTemplateFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFieldLanguageID = ProcessTemplateFieldLanguageID });

        }
        public Task<List<ProcessTemplateField>> GetProcessTemplateFields(string UserID, int ProcessTemplateID)
        {
            string usp = "usp_ProcessTemplateFields @UserID, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateField, dynamic>(usp, new { UserID = UserID, ProcessTemplateID = ProcessTemplateID });

        }
        public Task<ProcessTemplateField> GetProcessTemplateField(string UserID, int ProcessTemplateFieldID)
        {
            string usp = "usp_ProcessTemplateField @UserID, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateField, dynamic>(usp, new { UserID = UserID, ProcessTemplateFieldID = ProcessTemplateFieldID });

        }
        public Task<List<ProcessTemplateFlowConditionLanguage>> GetProcessTemplateFlowConditionLanguages(string UserID, int ProcessTemplateFlowConditionID)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguages @UserID, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowConditionID = ProcessTemplateFlowConditionID });

        }
        public Task<ProcessTemplateFlowConditionLanguage> GetProcessTemplateFlowConditionLanguage(string UserID, int ProcessTemplateFlowConditionLanguageID)
        {
            string usp = "usp_ProcessTemplateField @UserID, @ProcessTemplateFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowConditionLanguageID = ProcessTemplateFlowConditionLanguageID });

        }
        public Task<List<ProcessTemplateFlowCondition>> GetProcessTemplateFlowConditions(string UserID, int ProcessTemplateFlowID)
        {
            string usp = "usp_ProcessTemplateFlowConditions @UserID, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowCondition, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowID = ProcessTemplateFlowID });

        }
        public Task<ProcessTemplateFlowCondition> GetProcessTemplateFlowCondition(string UserID, int ProcessTemplateFlowConditionID)
        {
            string usp = "usp_ProcessTemplateFlowCondition @UserID, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowCondition, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowConditionID = ProcessTemplateFlowConditionID });

        }
        public Task<List<ProcessTemplateFlowLanguage>> GetProcessTemplateFlowLanguages(string UserID, int ProcessTemplateFlowID)
        {
            string usp = "usp_ProcessTemplateFlowLanguages @UserID, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowID = ProcessTemplateFlowID });

        }
        public Task<ProcessTemplateFlowLanguage> GetProcessTemplateFlowLanguage(string UserID, int ProcessTemplateFlowLanguageID)
        {
            string usp = "usp_ProcessTemplateFlowLanguage @UserID, @ProcessTemplateFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowLanguageID = ProcessTemplateFlowLanguageID });

        }
        public Task<List<ProcessTemplateFlow>> GetProcessTemplateFlows(string UserID, int ProcessTemplateID)
        {
            string usp = "usp_ProcessTemplateFlows @UserID, @ProcessTemplateD";
            return _sqlDataAccess.LoadData<ProcessTemplateFlow, dynamic>(usp, new { UserID = UserID, ProcessTemplateID = ProcessTemplateID });

        }
        public Task<ProcessTemplateFlow> GetProcessTemplateFlow(string UserID, int ProcessTemplateFlowID)
        {
            string usp = "usp_ProcessTemplateFlow @UserID, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlow, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowID = ProcessTemplateFlowID });

        }
        public Task<List<ProcessTemplateGroupLanguage>> GetProcessTemplateGroupLanguages(string UserID, int ProcessTemplateGroupID)
        {
            string usp = "usp_ProcessTemplateGroupLanguages @UserID, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateGroupID = ProcessTemplateGroupID });

        }
        public Task<ProcessTemplateGroupLanguage> GetProcessTemplateGroupLanguage(string UserID, int ProcessTemplateGroupLanguageID)
        {
            string usp = "usp_ProcessTemplateGroupLanguage @UserID, @ProcessTemplateGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateGroupLanguageID = ProcessTemplateGroupLanguageID });

        }
        public Task<List<ProcessTemplateLanguage>> GetProcessTemplateLanguages(string UserID, int ProcessTemplateID)
        {
            string usp = "usp_ProcessTemplateLanguages @UserID, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateID = ProcessTemplateID });

        }
        public Task<ProcessTemplateLanguage> GetProcessTemplateLanguage(string UserID, int ProcessTemplateLanguageID)
        {
            string usp = "usp_ProcessTemplateLanguage @UserID, @ProcessTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateLanguageID = ProcessTemplateLanguageID });

        }
        public Task<List<ProcessTemplateStageField>> GetProcessTemplateStageFields(string UserID, int ProcessTemplateStageID)
        {
            string usp = "usp_ProcessTemplateStageFields @UserID, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageField, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageID = ProcessTemplateStageID });

        }
        public Task<ProcessTemplateStageField> GetProcessTemplateStageField(string UserID, int ProcessTemplateStageFieldID)
        {
            string usp = "usp_ProcessTemplateStageField @UserID, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageField, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageFieldID = ProcessTemplateStageFieldID });

        }
        public Task<List<ProcessTemplateFieldStage>> GetProcessTemplateFieldStages(string UserID, int ProcessTemplateFieldID)
        {
            string usp = "usp_ProcessTemplateFieldStages @UserID, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldStage, dynamic>(usp, new { UserID = UserID, ProcessTemplateFieldID = ProcessTemplateFieldID });

        }
        public Task<List<ProcessTemplateStageFieldStatus>> GetProcessTemplateStageFieldStatuses(string UserID)
        {
            string usp = "usp_ProcessTemplateStageFieldStatuses @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserID = UserID });

        }
        //public Task<ProcessTemplateStageFieldStatus> GetProcessTemplateStageFieldStatus(string UserID, int ProcessTemplateStageFieldStatusID)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatus @UserID, @ProcessTemplateStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageFieldStatusID = ProcessTemplateStageFieldStatusID });

        //}
        public Task<List<ProcessTemplateStageLanguage>> GetProcessTemplateStageLanguages(string UserID, int ProcessTemplateStageID)
        {
            string usp = "usp_ProcessTemplateStageLanguage @UserID, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageID = ProcessTemplateStageID });

        }
        public Task<ProcessTemplateStageLanguage> GetProcessTemplateStageLanguage(string UserID, int ProcessTemplateStageLanguageID)
        {
            string usp = "usp_ProcessTemplateStageLanguage @UserID, @ProcessTemplateStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageLanguageID = ProcessTemplateStageLanguageID });

        }
        public Task<List<ProcessTemplateStage>> GetProcessTemplateStages(string UserID, int ProcessTemplateID)
        {
            string usp = "usp_ProcessTemplateStage @UserID, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateStage, dynamic>(usp, new { UserID = UserID, ProcessTemplateID = ProcessTemplateID });

        }
        public Task<ProcessTemplateStage> GetProcessTemplateStage(string UserID, int ProcessTemplateStageID)
        {
            string usp = "usp_ProcessTemplateStage @UserID, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStage, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageID = ProcessTemplateStageID });

        }
        public Task<List<ProcessTemplateFieldType>> GetProcessTemplateFieldTypes(string UserID)
        {
            string usp = "usp_ProcessTemplateFieldTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplateFieldType> GetProcessTemplateFieldType(string UserID, int ProcessTemplateFieldTypeID)
        {
            string usp = "usp_ProcessTemplateFieldType @UserID, @ProcessTemplateFieldTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldType, dynamic>(usp, new { UserID = UserID, ProcessTemplateFieldTypeID = ProcessTemplateFieldTypeID });

        }
        public Task<List<ProcessTemplateFlowConditionComparisonOperator>> GetProcessTemplateFlowConditionComparisonOperators(string UserID)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperators @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplateFlowConditionComparisonOperator> GetProcessTemplateFlowConditionComparisonOperator(string UserID, int ProcessTemplateFlowConditionComparisonOperatorID)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperator @UserID, @ProcessTemplateFlowConditionComparisonOperatorID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowConditionComparisonOperatorID = ProcessTemplateFlowConditionComparisonOperatorID });

        }
        public Task<List<ProcessTemplateFlowConditionType>> GetProcessTemplateFlowConditionTypes(string UserID)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplateFlowConditionType> GetProcessTemplateFlowConditionType(string UserID, int ProcessTemplateFlowConditionTypeID)
        {
            string usp = "usp_ProcessTemplateFlowConditionType @UserID, @ProcessTemplateFlowConditionTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserID = UserID, ProcessTemplateFlowConditionTypeID = ProcessTemplateFlowConditionTypeID });

        }
        public Task<List<ProcessTemplateGroup>> GetProcessTemplateGroups(string UserID)
        {
            string usp = "usp_ProcessTemplateGroups @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroup, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplateGroup> GetProcessTemplateGroup(string UserID, int ProcessTemplateGroupID)
        {
            string usp = "usp_ProcessTemplateGroup @UserID, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroup, dynamic>(usp, new { UserID = UserID, ProcessTemplateGroupID = ProcessTemplateGroupID });

        }
        public Task<List<ProcessTemplate>> GetProcessTemplates(string UserID)
        {
            string usp = "usp_ProcessTemplates @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplate, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplate> GetProcessTemplate(string UserID, int ProcessTemplateID)
        {
            string usp = "usp_ProcessTemplate @UserID, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplate, dynamic>(usp, new { UserID = UserID, ProcessTemplateID = ProcessTemplateID });

        }
        public Task<List<ProcessTemplateStageType>> GetProcessTemplateStageTypes(string UserID)
        {
            string usp = "usp_ProcessTemplateStageTypes @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ProcessTemplateStageType> GetProcessTemplateStageType(string UserID, int ProcessTemplateStageTypeID)
        {
            string usp = "usp_ProcessTemplateStageType @UserID, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageType, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageTypeID = ProcessTemplateStageTypeID });

        }
        public Task<List<ProcessTemplateStageTypeLanguage>> GetProcessTemplateStageTypeLanguages(string UserID, int ProcessTemplateStageTypeID)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguages @UserID, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageTypeID = ProcessTemplateStageTypeID });

        }
        public Task<ProcessTemplateStageTypeLanguage> GetProcessTemplateStageTypeLanguage(string UserID, int ProcessTemplateStageTypeLanguageID)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguage @UserID, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserID = UserID, ProcessTemplateStageTypeLanguageID = ProcessTemplateStageTypeLanguageID });

        }
    }
}
