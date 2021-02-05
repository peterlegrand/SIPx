using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldTypeList
    {
        [Key]
        public int ProcessTypeFieldTypeId { get; set; }
        public string Name { get; set; }

    }
}
