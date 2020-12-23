using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateUpdateGet ProcessTemplate { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
