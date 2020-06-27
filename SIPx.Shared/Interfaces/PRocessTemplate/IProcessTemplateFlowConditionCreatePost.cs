using System;

namespace SIPx.Shared
{
    public interface IProcessTemplateFlowConditionCreatePost
    {
        int ComparisonOperatorID { get; set; }
        string Description { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldID { get; set; }
        int ProcessTemplateFieldIDRole { get; set; }
        DateTime ProcessTemplateFlowConditionDate { get; set; }
        int ProcessTemplateFlowConditionInt { get; set; }
        string ProcessTemplateFlowConditionString { get; set; }
        int ProcessTemplateFlowConditionTypeID { get; set; }
        int ProcessTemplateFlowID { get; set; }
        int Sequence { get; set; }
        string UserID { get; set; }
    }
}