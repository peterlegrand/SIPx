using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageTypeCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTemplateStageTypeCreateGet ProcessTemplateStageType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
