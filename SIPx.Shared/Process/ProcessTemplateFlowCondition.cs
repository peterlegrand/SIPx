using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionOld : IProcessTemplateFlowConditionOld
    {
        public int ProcessTemplateFlowId { get; set; }
        [Key]
        public int ProcessTemplateFlowConditionId { get; set; }
        public int ProcessTemplateFlowConditionTypeId { get; set; }
        public int? ProcessTemplateFieldId { get; set; }
        public int? ProcessTemplateFieldIDRole { get; set; }
        public int? ComparisonOperatorId { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int? ProcessTemplateFlowConditionInt { get; set; }
        public DateTime? ProcessTemplateFlowConditionDate { get; set; }


    }
}
