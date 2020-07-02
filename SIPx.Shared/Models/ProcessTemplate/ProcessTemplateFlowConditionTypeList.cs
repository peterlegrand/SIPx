using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionTypeList
    {
        [Key]
        public int ProcessTemplateFlowConditionTypeId { get; set; }
        public string Name { get; set; }

    }
}
