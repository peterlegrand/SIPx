using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionOld : IProcessTypeFlowConditionOld
    {
        public int ProcessTypeFlowId { get; set; }
        [Key]
        public int ProcessTypeFlowConditionId { get; set; }
        public int ProcessTypeFlowConditionTypeId { get; set; }
        public int? ProcessTypeFieldId { get; set; }
        public int? ProcessTypeFieldIDRole { get; set; }
        public int? ComparisonOperatorId { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int? ProcessTypeFlowConditionInt { get; set; }
        public DateTime? ProcessTypeFlowConditionDate { get; set; }


    }
}
