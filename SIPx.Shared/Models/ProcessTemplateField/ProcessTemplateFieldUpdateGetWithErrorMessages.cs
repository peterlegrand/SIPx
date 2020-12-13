using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFieldUpdateGet ProcessTemplateField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
