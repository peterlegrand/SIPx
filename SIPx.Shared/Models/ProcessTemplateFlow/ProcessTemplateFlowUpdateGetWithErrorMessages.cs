using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFlowUpdateGet ProcessTemplateFlow { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
