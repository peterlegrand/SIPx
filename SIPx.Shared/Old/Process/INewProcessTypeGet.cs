using System;

namespace SIPx.Shared
{
    public interface INewProcessTypeGet
    {
        DateTime? DateTimeValue { get; set; }
        string Description { get; set; }
        int? IntValue { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeFieldTypeId { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeStageFieldStatusId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
    }
}