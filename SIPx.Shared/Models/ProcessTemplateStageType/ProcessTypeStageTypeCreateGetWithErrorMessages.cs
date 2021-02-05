using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageTypeCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeStageTypeCreateGet ProcessTypeStageType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
