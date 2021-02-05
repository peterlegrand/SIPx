using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassComparisonOperatorList
    {
        [Key]
        public int ProcessTypeFlowPassComparisonOperatorId { get; set; }
        public string Name { get; set; }

    }
}
