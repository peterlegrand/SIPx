using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateGroupCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateGroupCreateGet ProcessTemplateGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
