using System;

namespace SIPx.Shared
{
    public interface INewProcessFieldFromAPI
    {
        DateTime? DateTimeValue { get; set; }
        int? IntValue { get; set; }
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
    }
}