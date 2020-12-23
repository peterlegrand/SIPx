using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageFieldUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
