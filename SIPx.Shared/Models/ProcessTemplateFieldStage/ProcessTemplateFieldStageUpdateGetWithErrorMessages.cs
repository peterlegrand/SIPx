using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldStageUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateFieldStageUpdateGet ProcessTemplateFieldStage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
