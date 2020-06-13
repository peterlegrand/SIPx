using System;

namespace SIPx.Shared
{
    public interface INewProcessTemplateGet
    {
        DateTime? DateTimeValue { get; set; }
        string Description { get; set; }
        int? IntValue { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldID { get; set; }
        int ProcessTemplateFieldTypeID { get; set; }
        int ProcessTemplateID { get; set; }
        int ProcessTemplateStageFieldStatusID { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeID { get; set; }
    }
}