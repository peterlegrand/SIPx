using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateCreateGet ProcessTemplate { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
