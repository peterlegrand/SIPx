using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionTypeList
    {
        [Key]
        public int ProcessTypeFlowConditionTypeId { get; set; }
        public string Name { get; set; }

    }
}
