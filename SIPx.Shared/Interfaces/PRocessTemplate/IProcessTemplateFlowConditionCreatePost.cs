using System;

namespace SIPx.Shared
{
    public interface IProcessTemplateFlowConditionCreatePost
    {
        int ComparisonOperatorId { get; set; }
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateFieldIDRole { get; set; }
        DateTime ProcessTemplateFlowConditionDate { get; set; }
        int ProcessTemplateFlowConditionInt { get; set; }
        string ProcessTemplateFlowConditionString { get; set; }
        int ProcessTemplateFlowConditionTypeId { get; set; }
        int ProcessTemplateFlowId { get; set; }
        int Sequence { get; set; }
        string UserId { get; set; }
    }
}