using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class CodeTypeList
    {
        [Key]
        public int CodeTypeId { get; set; }
        public string Name { get; set; }

    }
}
