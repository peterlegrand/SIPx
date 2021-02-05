using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFieldUpdateGet ProcessTypeField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
