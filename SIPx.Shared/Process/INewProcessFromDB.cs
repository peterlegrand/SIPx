using System;

namespace SIPx.Shared
{
    public interface INewProcessFromDB
    {
        DateTime DateTimeValue { get; set; }
        int IntValue { get; set; }
        int ProcessTemplateFieldID { get; set; }
        int ProcessTemplateFieldTypeID { get; set; }
        int ProcessTemplateID { get; set; }
        int ProcessTemplateStageFieldStatusID { get; set; }
        int Sequence { get; set; }
        string StringValue { get; set; }
        int ValueUpdateTypeID { get; set; }
        int ProcessTemplateStageID { get; set; }
    }
}