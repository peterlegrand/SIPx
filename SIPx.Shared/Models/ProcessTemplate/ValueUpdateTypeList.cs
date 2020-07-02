using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ValueUpdateTypeList
    {
        [Key]
        public int ValueUpdateTypeId { get; set; }
        public string Name { get; set; }

    }
}
