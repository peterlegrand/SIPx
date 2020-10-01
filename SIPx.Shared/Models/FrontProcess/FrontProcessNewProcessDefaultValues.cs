using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessNewProcessDefaultValues 
    {
        [Key]
        public int ProcessTemplateFieldID { get; set; }
        public int ValueUpdateTypeID { get; set; }
        public string StringValue { get; set; }
        public int? IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
    }
}
