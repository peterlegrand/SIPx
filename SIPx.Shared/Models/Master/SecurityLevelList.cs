using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class SecurityLevelList
    {
        [Key]
        public int SecurityLevelId { get; set; }
        public string Name { get; set; }

    }
}
