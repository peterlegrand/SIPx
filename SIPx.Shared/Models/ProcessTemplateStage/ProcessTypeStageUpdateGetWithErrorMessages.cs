using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeStageUpdateGet ProcessTypeStage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
