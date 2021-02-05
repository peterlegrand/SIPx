using System;

namespace SIPx.Shared
{
    public interface INewProcessFieldFromAPI
    {
        DateTime? DateTimeValue { get; set; }
        int? IntValue { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeId { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
    }
}