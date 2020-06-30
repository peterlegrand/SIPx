using System;

namespace SIPx.Shared
{
    public interface IGetProcessTemplateFieldDefinition
    {
        DateTime DateValue { get; set; }
        int IntValue { get; set; }
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateFieldTypeId { get; set; }
        int ProcessTemplateStageFieldStatusId { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
    }
}