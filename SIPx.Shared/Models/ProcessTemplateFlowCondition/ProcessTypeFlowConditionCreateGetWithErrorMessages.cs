using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
