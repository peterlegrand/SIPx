using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeList
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public string Name { get; set; }

    }
}
