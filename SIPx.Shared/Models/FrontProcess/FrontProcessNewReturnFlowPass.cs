using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessNewReturnFlowPass
    {
        [Key]
        public int ProcessTypeFlowConditionTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int ProcessTypeFlowConditionInt { get; set; }
        public DateTime ProcessTypeFlowConditionDate { get; set; }
        public int ProcessTypeFieldTypeId { get; set; }
        public string StageFieldStringValue { get; set; }
        public int StageFieldIntValue { get; set; }
        public DateTime StageFieldDateTimeValue { get; set; }
    }
}
