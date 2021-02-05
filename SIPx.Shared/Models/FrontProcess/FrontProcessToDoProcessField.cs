using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessToDoProcessField
    {
        [Key]
        public int ProcessFieldId { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public int ProcessTypeFieldID { get; set; }
        public int ProcessTypeFieldTypeID { get; set; }
    }
}
