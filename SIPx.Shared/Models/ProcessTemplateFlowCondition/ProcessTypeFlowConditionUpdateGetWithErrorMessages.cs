using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
