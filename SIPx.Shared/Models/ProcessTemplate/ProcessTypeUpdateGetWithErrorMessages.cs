using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeUpdateGet ProcessType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
