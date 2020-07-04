using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTemplateStageFieldEditGet
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
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateStageFieldId { get; set; }
        List<ProcessTemplateStageFieldStatusList> ProcessTemplateStageFieldStatuses { get; set; }
        int ProcessTemplateStageFieldStatusId { get; set; }
        int ProcessTemplateStageId { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
        List<ValueUpdateTypeList> ValueUpdateTypes { get; set; }
    }
}