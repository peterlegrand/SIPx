using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionComparisonOperatorList
    {
        [Key]
        public int ProcessTypeFlowConditionComparisonOperatorId { get; set; }
        public string Name { get; set; }

    }
}
