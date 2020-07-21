using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<List<ProcessTemplateFieldIndexGet>> ProcessTemplateFieldIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFieldLanguageIndexGet>> ProcessTemplateFieldLanguageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldLanguageIndexGet> ProcessTemplateFieldLanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId);
        Task<List<ProcessTemplateStageFieldIndexGet>> ProcessTemplateFieldStageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateStageFieldUpdateGet> ProcessTemplateFieldStageUpdateGet(string UserId, int ProcessTemplateStageFieldID);
        Task<List<ProcessTemplateFieldType>> ProcessTemplateFieldTypeIndexGet(string UserId);
        Task<List<ProcessTemplateFieldTypeList>> ProcessTemplateFieldTypeList(string UserId);
        Task<ProcessTemplateFieldType> ProcessTemplateFieldTypeUpdateGet(string UserId, int ProcessTemplateFieldTypeId);
        Task<ProcessTemplateFieldUpdateGet> ProcessTemplateFieldUpdateGet(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperatorIndexGet(string UserId);
        Task<ProcessTemplateFlowConditionComparisonOperator> ProcessTemplateFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId);
        Task<List<ProcessTemplateFlowConditionIndexGet>> ProcessTemplateFlowConditionIndexGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFlowConditionLanguageIndexGet>> ProcessTemplateFlowConditionLanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<ProcessTemplateFlowConditionLanguageIndexGet> ProcessTemplateFlowConditionLanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId);
        Task<List<ProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypeIndexGet(string UserId);
        Task<ProcessTemplateFlowConditionType> ProcessTemplateFlowConditionTypeUpdateGet(string UserId, int ProcessTemplateFlowConditionTypeId);
        Task<ProcessTemplateFlowConditionUpdateGet> ProcessTemplateFlowConditionUpdateGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFlowIndexGet>> ProcessTemplateFlowIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFlowLanguageIndexGet>> ProcessTemplateFlowLanguageIndexGet(string UserId, int ProcessTemplateFlowId);
        Task<ProcessTemplateFlowLanguageIndexGet> ProcessTemplateFlowLanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId);
        Task<ProcessTemplateFlowUpdateGet> ProcessTemplateFlowUpdateGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateStageList>> ProcessTemplateFlowUpdateGetStageList(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateGroupIndexGet>> ProcessTemplateGroupIndexGet(string UserId);
        Task<List<ProcessTemplateGroupLanguageIndexGet>> ProcessTemplateGroupLanguageIndexGet(string UserId, int ProcessTemplateGroupId);
        Task<ProcessTemplateGroupLanguageIndexGet> ProcessTemplateGroupLanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId);
        Task<ProcessTemplateGroupUpdateGet> ProcessTemplateGroupUpdateGet(string UserId, int ProcessTemplateGroupId);
        Task<List<ProcessTemplateIndexGet>> ProcessTemplateIndexGet(string UserId);
        Task<List<ProcessTemplateLanguageIndexGet>> ProcessTemplateLanguageIndexGet(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateLanguageIndexGet> ProcessTemplateLanguageUpdateGet(string UserId, int ProcessTemplateLanguageId);
        Task<List<ProcessTemplateStageFieldIndexGet>> ProcessTemplateStageFieldIndexGet(string UserId, int ProcessTemplateStageId);
        Task<List<ProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatusIndexGet(string UserId);
        Task<ProcessTemplateStageFieldStatusUpdateGet> ProcessTemplateStageFieldStatusUpdateGet(string UserId, int ProcessTemplateStageFieldDStatusId);
        Task<ProcessTemplateStageFieldUpdateGet> ProcessTemplateStageFieldUpdateGet(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateFieldList>> ProcessTemplateStageFieldUpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateFieldList>> ProcessTemplateStageFieldUpdateGetSequence(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateStageFieldStatusList>> ProcessTemplateStageFieldUpdateGetStatusList(string UserId);
        Task<List<ValueUpdateTypeList>> ProcessTemplateStageFieldUpdateGetValueUpdateTypeList(string UserId);
        Task<List<ProcessTemplateStageIndexGet>> ProcessTemplateStageIndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateStageLanguageIndexGet>> ProcessTemplateStageLanguageIndexGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateStageLanguageIndexGet> ProcessTemplateStageLanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId);
        Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId);
        Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageUpdateGet> ProcessTemplateStageUpdateGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateUpdateGet> ProcessTemplateUpdateGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateGroupList>> ProcessTemplateGroupList(string UserId);
    }
}