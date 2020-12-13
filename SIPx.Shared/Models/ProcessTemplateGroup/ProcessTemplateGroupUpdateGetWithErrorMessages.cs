using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateGroupUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateGroupUpdateGet ProcessTemplateGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
