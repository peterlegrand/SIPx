using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessFromDB
    {
        DateTime DateTimeValue { get; set; }
        int? IntValue { get; set; }
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateFieldTypeId { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateStageFieldStatusId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
        int ProcessTemplateStageId { get; set; }
        string Name { get; set; }
        string ControlId { get; set; }
    }
}