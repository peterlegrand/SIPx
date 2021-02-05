using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageFieldUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeStageFieldUpdateGet ProcessTypeStageField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
