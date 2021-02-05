using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
