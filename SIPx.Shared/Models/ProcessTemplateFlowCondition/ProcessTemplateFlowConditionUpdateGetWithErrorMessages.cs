using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
