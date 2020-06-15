using System;

namespace SIPx.Shared
{
    public interface INewProcessFieldFromAPI
    {
        DateTime? DateTimeValue { get; set; }
        int? IntValue { get; set; }
        int ProcessTemplateFieldID { get; set; }
        int ProcessTemplateID { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
    }
}