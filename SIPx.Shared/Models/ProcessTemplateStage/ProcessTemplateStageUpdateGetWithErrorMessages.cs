using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateStageUpdateGet ProcessTemplateStage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
