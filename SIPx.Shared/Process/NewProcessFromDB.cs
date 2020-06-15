using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessFromDB : INewProcessFromDB
    {
        [Key]
        public int Sequence { get; set; }
        public int ProcessTemplateStageFieldStatusID { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string StringValue { get; set; }
        public int ValueUpdateTypeID { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public int ProcessTemplateFieldTypeID { get; set; }
        public int ProcessTemplateID { get; set; }
        public int ProcessTemplateStageID { get; set; }
    }
}
