using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassTypeList
    {
        [Key]
        public int ProcessTypeFlowPassTypeId { get; set; }
        public string Name { get; set; }

    }
}
