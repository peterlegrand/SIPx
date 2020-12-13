using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
