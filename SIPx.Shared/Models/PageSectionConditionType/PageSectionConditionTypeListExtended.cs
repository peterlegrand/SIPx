using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionConditionTypeListExtended
    {
        [Key]
        public string ExtendedId { get; set; }
        public string Name { get; set; }
        public string StringValue { get; set; }
        public DateTime DateValue { get; set; }
        public int IntValue { get; set; }
        public string ControlA { get; set; }
        public string ControlHide { get; set; }
        public string ControlShow { get; set; }
    }
}
