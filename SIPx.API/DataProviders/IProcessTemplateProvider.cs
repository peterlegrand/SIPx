using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<ProcessTemplateFlowConditionLanguage> ProcessTemplateFlowConditionLanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId);
        Task<List<ProcessTemplateField>> ProcessTemplateFieldIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFieldLanguage>> ProcessTemplateFieldLanguageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldLanguage> ProcessTemplateFieldLanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId);
        Task<List<ProcessTemplateFieldStage>> ProcessTemplateFieldStageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFieldType>> ProcessTemplateFieldTypeIndexGet(string UserId);
        Task<ProcessTemplateFieldType> ProcessTemplateFieldTypeUpdateGet(string UserId, int ProcessTemplateFieldTypeId);
        Task<ProcessTemplateField> ProcessTemplateFieldUpdateGet(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperatorIndexGet(string UserId);
        Task<ProcessTemplateFlowConditionComparisonOperator> ProcessTemplateFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId);
        Task<List<ProcessTemplateFlowCondition>> ProcessTemplateFlowConditionIndexGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFlowConditionLanguage>> ProcessTemplateFlowConditionLanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypeIndexGet(string UserId);
        Task<ProcessTemplateFlowConditionType> ProcessTemplateFlowConditionTypeUpdateGet(string UserId, int ProcessTemplateFlowConditionTypeId);
        Task<ProcessTemplateFlowCondition> ProcessTemplateFlowConditionUpdateGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFlow>> ProcessTemplateFlowIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFlowLanguage>> ProcessTemplateFlowLanguageIndexGet(string UserId, int ProcessTemplateFlowId);
        Task<ProcessTemplateFlowLanguage> ProcessTemplateFlowLanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId);
        Task<ProcessTemplateFlow> ProcessTemplateFlowUpdateGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateGroup>> ProcessTemplateGroupIndexGet(string UserId);
        Task<List<ProcessTemplateGroupLanguage>> ProcessTemplateGroupLanguageIndexGet(string UserId, int ProcessTemplateGroupId);
        Task<ProcessTemplateGroupLanguage> ProcessTemplateGroupLanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId);
        Task<ProcessTemplateGroup> ProcessTemplateGroupUpdateGet(string UserId, int ProcessTemplateGroupId);
        Task<List<ProcessTemplate>> ProcessTemplateIndexGet(string UserId);
        Task<List<ProcessTemplateLanguage>> ProcessTemplateLanguageIndexGet(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateLanguage> ProcessTemplateLanguageUpdateGet(string UserId, int ProcessTemplateLanguageId);
        Task<List<ProcessTemplateStageField>> ProcessTemplateStageFieldIndexGet(string UserId, int ProcessTemplateStageId);
        Task<List<ProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatusIndexGet(string UserId);
        Task<ProcessTemplateStageField> ProcessTemplateStageFieldUpdateGet(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateStage>> ProcessTemplateStageIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateStageLanguage>> ProcessTemplateStageLanguageIndexGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateStageLanguage> ProcessTemplateStageLanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId);
        Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId);
        Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStage> ProcessTemplateStageUpdateGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplate> ProcessTemplateUpdateGet(string UserId, int ProcessTemplateId);
    }
}