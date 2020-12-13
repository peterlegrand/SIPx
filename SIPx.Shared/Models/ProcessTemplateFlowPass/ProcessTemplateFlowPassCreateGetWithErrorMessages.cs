using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
