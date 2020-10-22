using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassComparisonOperatorList
    {
        [Key]
        public int ProcessTemplateFlowPassComparisonOperatorId { get; set; }
        public string Name { get; set; }

    }
}
