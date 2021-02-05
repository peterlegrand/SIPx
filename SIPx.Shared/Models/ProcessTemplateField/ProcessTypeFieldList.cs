using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldList
    {
        [Key]
        public int ProcessTypeFieldId { get; set; }
        public string Name { get; set; }

    }
}
