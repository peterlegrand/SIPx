using System;

namespace SIPx.Shared
{
    public interface IGetProcessTemplateFieldDefinition
    {
        DateTime DateValue { get; set; }
        int IntValue { get; set; }
        int ProcessTemplateFieldID { get; set; }
        int ProcessTemplateFieldTypeID { get; set; }
        int ProcessTemplateStageFieldStatusID { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeID { get; set; }
    }
}