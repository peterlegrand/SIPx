using System;

namespace SIPx.Shared
{
    public interface IProcessTemplateFlowCondition
    {
        int? ComparisonOperatorId { get; set; }
        int? ProcessTemplateFieldId { get; set; }
        int? ProcessTemplateFieldIDRole { get; set; }
        DateTime? ProcessTemplateFlowConditionDate { get; set; }
        int ProcessTemplateFlowConditionId { get; set; }
        int? ProcessTemplateFlowConditionInt { get; set; }
        string ProcessTemplateFlowConditionString { get; set; }
        int ProcessTemplateFlowConditionTypeId { get; set; }
        int ProcessTemplateFlowId { get; set; }

    }
}