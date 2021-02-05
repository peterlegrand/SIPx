using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeStageTypeUpdateGet ProcessTypeStageType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
