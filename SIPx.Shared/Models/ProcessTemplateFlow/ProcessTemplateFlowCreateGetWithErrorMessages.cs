using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFlowCreateGet ProcessTemplateFlow { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
