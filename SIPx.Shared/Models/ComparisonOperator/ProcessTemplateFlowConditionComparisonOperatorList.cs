using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionComparisonOperatorList
    {
        [Key]
        public int ProcessTemplateFlowConditionComparisonOperatorId { get; set; }
        public string Name { get; set; }

    }
}
