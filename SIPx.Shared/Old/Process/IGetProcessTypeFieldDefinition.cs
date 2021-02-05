using System;

namespace SIPx.Shared
{
    public interface IGetProcessTypeFieldDefinition
    {
        DateTime DateValue { get; set; }
        int IntValue { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeFieldTypeId { get; set; }
        int ProcessTypeStageFieldStatusId { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
    }
}