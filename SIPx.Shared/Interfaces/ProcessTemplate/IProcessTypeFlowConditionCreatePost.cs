using System;

namespace SIPx.Shared
{
    public interface IProcessTypeFlowConditionCreatePost
    {
        int ComparisonOperatorId { get; set; }
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeFieldIDRole { get; set; }
        DateTime ProcessTypeFlowConditionDate { get; set; }
        int ProcessTypeFlowConditionInt { get; set; }
        string ProcessTypeFlowConditionString { get; set; }
        int ProcessTypeFlowConditionTypeId { get; set; }
        int ProcessTypeFlowId { get; set; }
        int Sequence { get; set; }
        string UserId { get; set; }
    }
}