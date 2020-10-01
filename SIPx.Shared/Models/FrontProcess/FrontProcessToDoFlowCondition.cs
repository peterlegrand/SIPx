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
        public int ProcessTemplateFlowConditionID { get; set; }
        public int ProcessTemplateFlowConditionTypeID { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int ProcessTemplateFlowConditionInt { get; set; }
        public DateTime ProcessTemplateFlowConditionDate { get; set; }
    }
}
