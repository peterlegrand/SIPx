using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessProcessTypeFlowConditions
    {
        [Key]
        public int ProcessTypeFlowConditionId { get; set; }
        public int ProcessTypeFlowConditionTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int ProcessTypeFlowConditionInt { get; set; }
        public DateTime ProcessTypeFlowConditionDate { get; set; }
        public string StageFieldStringValue { get; set; }
        public int StageFieldIntValue { get; set; }
        public DateTime StageFieldDateTimeValue { get; set; }
    }
}
