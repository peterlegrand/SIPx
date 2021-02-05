using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessFromDB
    {
        DateTime DateTimeValue { get; set; }
        int? IntValue { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeFieldTypeId { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeStageFieldStatusId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        string HTMLStringValue { get; set; }
        string UserId { get; set; }
        string RoleId { get; set; }
        int ValueUpdateTypeId { get; set; }
        int ProcessTypeStageId { get; set; }
        string Name { get; set; }
        string ControlId { get; set; }
    }
}