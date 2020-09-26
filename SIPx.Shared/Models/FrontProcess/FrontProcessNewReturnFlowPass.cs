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
        public int ProcessTemplateFlowConditionTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int ProcessTemplateFlowConditionInt { get; set; }
        public DateTime ProcessTemplateFlowConditionDate { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
    }
}
