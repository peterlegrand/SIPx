using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFieldCreateGet ProcessTemplateField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
