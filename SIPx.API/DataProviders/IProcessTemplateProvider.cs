using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<ProcessTemplate> GetProcessTemplate(string UserID, int ProcessTemplateID);
        Task<ProcessTemplateField> GetProcessTemplateField(string UserID, int ProcessTemplateFieldID);
        Task<ProcessTemplateFieldLanguage> GetProcessTemplateFieldLanguage(string UserID, int ProcessTemplateFieldLanguageID);
        Task<List<ProcessTemplateFieldLanguage>> GetProcessTemplateFieldLanguages(string UserID, int ProcessTemplateFieldID);
        Task<List<ProcessTemplateField>> GetProcessTemplateFields(string UserID, int ProcessTemplateID);
        Task<List<ProcessTemplateFieldStage>> GetProcessTemplateFieldStages(string UserID, int ProcessTemplateFieldID);
        Task<ProcessTemplateFieldType> GetProcessTemplateFieldType(string UserID, int ProcessTemplateFieldTypeID);
        Task<List<ProcessTemplateFieldType>> GetProcessTemplateFieldTypes(string UserID);
        Task<ProcessTemplateFlow> GetProcessTemplateFlow(string UserID, int ProcessTemplateFlowID);
        Task<ProcessTemplateFlowCondition> GetProcessTemplateFlowCondition(string UserID, int ProcessTemplateFlowConditionID);
        Task<ProcessTemplateFlowConditionComparisonOperator> GetProcessTemplateFlowConditionComparisonOperator(string UserID, int ProcessTemplateFlowConditionComparisonOperatorID);
        Task<List<ProcessTemplateFlowConditionComparisonOperator>> GetProcessTemplateFlowConditionComparisonOperators(string UserID);
        Task<ProcessTemplateFlowConditionLanguage> GetProcessTemplateFlowConditionLanguage(string UserID, int ProcessTemplateFlowConditionLanguageID);
        Task<List<ProcessTemplateFlowConditionLanguage>> GetProcessTemplateFlowConditionLanguages(string UserID, int ProcessTemplateFlowConditionID);
        Task<List<ProcessTemplateFlowCondition>> GetProcessTemplateFlowConditions(string UserID, int ProcessTemplateFlowID);
        Task<ProcessTemplateFlowConditionType> GetProcessTemplateFlowConditionType(string UserID, int ProcessTemplateFlowConditionTypeID);
        Task<List<ProcessTemplateFlowConditionType>> GetProcessTemplateFlowConditionTypes(string UserID);
        Task<ProcessTemplateFlowLanguage> GetProcessTemplateFlowLanguage(string UserID, int ProcessTemplateFlowLanguageID);
        Task<List<ProcessTemplateFlowLanguage>> GetProcessTemplateFlowLanguages(string UserID, int ProcessTemplateFlowID);
        Task<List<ProcessTemplateFlow>> GetProcessTemplateFlows(string UserID, int ProcessTemplateID);
        Task<ProcessTemplateGroup> GetProcessTemplateGroup(string UserID, int ProcessTemplateGroupID);
        Task<ProcessTemplateGroupLanguage> GetProcessTemplateGroupLanguage(string UserID, int ProcessTemplateGroupLanguageID);
        Task<List<ProcessTemplateGroupLanguage>> GetProcessTemplateGroupLanguages(string UserID, int ProcessTemplateGroupID);
        Task<List<ProcessTemplateGroup>> GetProcessTemplateGroups(string UserID);
        Task<ProcessTemplateLanguage> GetProcessTemplateLanguage(string UserID, int ProcessTemplateLanguageID);
        Task<List<ProcessTemplateLanguage>> GetProcessTemplateLanguages(string UserID, int ProcessTemplateID);
        Task<List<ProcessTemplate>> GetProcessTemplates(string UserID);
        Task<ProcessTemplateStage> GetProcessTemplateStage(string UserID, int ProcessTemplateStageID);
        Task<ProcessTemplateStageField> GetProcessTemplateStageField(string UserID, int ProcessTemplateStageFieldID);
        Task<List<ProcessTemplateStageField>> GetProcessTemplateStageFields(string UserID, int ProcessTemplateStageID);
        Task<List<ProcessTemplateStageFieldStatus>> GetProcessTemplateStageFieldStatuses(string UserID);
        Task<ProcessTemplateStageLanguage> GetProcessTemplateStageLanguage(string UserID, int ProcessTemplateStageLanguageID);
        Task<List<ProcessTemplateStageLanguage>> GetProcessTemplateStageLanguages(string UserID, int ProcessTemplateStageID);
        Task<List<ProcessTemplateStage>> GetProcessTemplateStages(string UserID, int ProcessTemplateID);
        Task<ProcessTemplateStageType> GetProcessTemplateStageType(string UserID, int ProcessTemplateStageTypeID);
        Task<ProcessTemplateStageTypeLanguage> GetProcessTemplateStageTypeLanguage(string UserID, int ProcessTemplateStageTypeLanguageID);
        Task<List<ProcessTemplateStageTypeLanguage>> GetProcessTemplateStageTypeLanguages(string UserID, int ProcessTemplateStageTypeID);
        Task<List<ProcessTemplateStageType>> GetProcessTemplateStageTypes(string UserID);
    }
}