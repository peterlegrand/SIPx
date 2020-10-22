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
    }
}
