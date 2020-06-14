using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class GetProcessTemplateFieldDefinition : IGetProcessTemplateFieldDefinition
    {
        [Key]
        public int ProcessTemplateFieldID { get; set; }
        public int ProcessTemplateFieldTypeID { get; set; }
        public int ValueUpdateTypeID { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime DateValue { get; set; }
        public int ProcessTemplateStageFieldStatusID { get; set; }
    }
}
