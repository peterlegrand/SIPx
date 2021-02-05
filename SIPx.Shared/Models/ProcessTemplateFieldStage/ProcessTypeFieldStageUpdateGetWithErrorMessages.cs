using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldStageUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
