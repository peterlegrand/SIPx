using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateStageCreateGet ProcessTemplateStage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
