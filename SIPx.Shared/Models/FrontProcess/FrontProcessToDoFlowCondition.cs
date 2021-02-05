using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessToDoFlowCondition
    {
        [Key]
        public int ProcessTypeFlowConditionID { get; set; }
        public int ProcessTypeFlowConditionTypeID { get; set; }
        public int ProcessTypeFieldID { get; set; }
        public int ProcessTypeFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int ProcessTypeFlowConditionInt { get; set; }
        public DateTime ProcessTypeFlowConditionDate { get; set; }
    }
}
