using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeCreateGet ProcessType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
