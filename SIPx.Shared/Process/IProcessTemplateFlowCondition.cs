using System;

namespace SIPx.Shared
{
    public interface IProcessTemplateFlowCondition
    {
        int? ComparisonOperatorID { get; set; }
        int? ProcessTemplateFieldID { get; set; }
        int? ProcessTemplateFieldIDRole { get; set; }
        DateTime? ProcessTemplateFlowConditionDate { get; set; }
        int ProcessTemplateFlowConditionId { get; set; }
        int? ProcessTemplateFlowConditionInt { get; set; }
        string ProcessTemplateFlowConditionString { get; set; }
        int ProcessTemplateFlowConditionTypeID { get; set; }
        int ProcessTemplateFlowId { get; set; }

    }
}