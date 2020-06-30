using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<ProcessTemplate> GetProcessTemplate(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateField> GetProcessTemplateField(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldLanguage> GetProcessTemplateFieldLanguage(string UserId, int ProcessTemplateFieldLanguageId);
        Task<List<ProcessTemplateFieldLanguage>> GetProcessTemplateFieldLanguages(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateField>> GetProcessTemplateFields(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFieldStage>> GetProcessTemplateFieldStages(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldType> GetProcessTemplateFieldType(string UserId, int ProcessTemplateFieldTypeId);
        Task<List<ProcessTemplateFieldType>> GetProcessTemplateFieldTypes(string UserId);
        Task<ProcessTemplateFlow> GetProcessTemplateFlow(string UserId, int ProcessTemplateFlowId);
        Task<ProcessTemplateFlowCondition> GetProcessTemplateFlowCondition(string UserId, int ProcessTemplateFlowConditionId);
        Task<ProcessTemplateFlowConditionComparisonOperator> GetProcessTemplateFlowConditionComparisonOperator(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId);
        Task<List<ProcessTemplateFlowConditionComparisonOperator>> GetProcessTemplateFlowConditionComparisonOperators(string UserId);
        Task<ProcessTemplateFlowConditionLanguage> GetProcessTemplateFlowConditionLanguage(string UserId, int ProcessTemplateFlowConditionLanguageId);
        Task<List<ProcessTemplateFlowConditionLanguage>> GetProcessTemplateFlowConditionLanguages(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFlowCondition>> GetProcessTemplateFlowConditions(string UserId, int ProcessTemplateFlowId);
        Task<ProcessTemplateFlowConditionType> GetProcessTemplateFlowConditionType(string UserId, int ProcessTemplateFlowConditionTypeId);
        Task<List<ProcessTemplateFlowConditionType>> GetProcessTemplateFlowConditionTypes(string UserId);
        Task<ProcessTemplateFlowLanguage> GetProcessTemplateFlowLanguage(string UserId, int ProcessTemplateFlowLanguageId);
        Task<List<ProcessTemplateFlowLanguage>> GetProcessTemplateFlowLanguages(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFlow>> GetProcessTemplateFlows(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateGroup> GetProcessTemplateGroup(string UserId, int ProcessTemplateGroupId);
        Task<ProcessTemplateGroupLanguage> GetProcessTemplateGroupLanguage(string UserId, int ProcessTemplateGroupLanguageId);
        Task<List<ProcessTemplateGroupLanguage>> GetProcessTemplateGroupLanguages(string UserId, int ProcessTemplateGroupId);
        Task<List<ProcessTemplateGroup>> GetProcessTemplateGroups(string UserId);
        Task<ProcessTemplateLanguage> GetProcessTemplateLanguage(string UserId, int ProcessTemplateLanguageId);
        Task<List<ProcessTemplateLanguage>> GetProcessTemplateLanguages(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplate>> GetProcessTemplates(string UserId);
        Task<ProcessTemplateStage> GetProcessTemplateStage(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateStageField> GetProcessTemplateStageField(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateStageField>> GetProcessTemplateStageFields(string UserId, int ProcessTemplateStageId);
        Task<List<ProcessTemplateStageFieldStatus>> GetProcessTemplateStageFieldStatuses(string UserId);
        Task<ProcessTemplateStageLanguage> GetProcessTemplateStageLanguage(string UserId, int ProcessTemplateStageLanguageId);
        Task<List<ProcessTemplateStageLanguage>> GetProcessTemplateStageLanguages(string UserId, int ProcessTemplateStageId);
        Task<List<ProcessTemplateStage>> GetProcessTemplateStages(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateStageType> GetProcessTemplateStageType(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguage> GetProcessTemplateStageTypeLanguage(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<List<ProcessTemplateStageTypeLanguage>> GetProcessTemplateStageTypeLanguages(string UserId, int ProcessTemplateStageTypeId);
        Task<List<ProcessTemplateStageType>> GetProcessTemplateStageTypes(string UserId);
    }
}