using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeGroupList
    {
        [Key]
        public int ProcessTypeGroupId { get; set; }
        public string Name { get; set; }

    }
}
