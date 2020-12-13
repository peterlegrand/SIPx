using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
