using System;

namespace SIPx.Shared
{
    public interface IProcessTypeFlowConditionOld
    {
        int? ComparisonOperatorId { get; set; }
        int? ProcessTypeFieldId { get; set; }
        int? ProcessTypeFieldIDRole { get; set; }
        DateTime? ProcessTypeFlowConditionDate { get; set; }
        int ProcessTypeFlowConditionId { get; set; }
        int? ProcessTypeFlowConditionInt { get; set; }
        string ProcessTypeFlowConditionString { get; set; }
        int ProcessTypeFlowConditionTypeId { get; set; }
        int ProcessTypeFlowId { get; set; }

    }
}