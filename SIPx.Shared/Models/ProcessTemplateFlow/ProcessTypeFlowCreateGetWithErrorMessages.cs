using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFlowCreateGet ProcessTypeFlow { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
