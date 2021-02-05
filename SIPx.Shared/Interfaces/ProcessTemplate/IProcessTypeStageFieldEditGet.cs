using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTypeStageFieldEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime DateTimeValue { get; set; }
        string Description { get; set; }
        int IntValue { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeStageFieldId { get; set; }
        List<ProcessTypeStageFieldStatusList> ProcessTypeStageFieldStatuses { get; set; }
        int ProcessTypeStageFieldStatusId { get; set; }
        int ProcessTypeStageId { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
        List<ValueUpdateTypeList> ValueUpdateTypes { get; set; }
    }
}