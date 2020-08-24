using System;
using System.Collections.Generic;
using System.Text;

namespace SIPx.Shared.Models.FrontProcess
{
    public class ProcessFieldsToDataTable
    {
        public int ProcessFieldId { get; set; }
        public int ProcessId { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string ModifierId { get; set; }
        public DateTime  ModifiedDate { get; set; }
    }
}
