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
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateFieldTypeId { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateStageFieldStatusId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeId { get; set; }
    }
}