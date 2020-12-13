using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessCreateGetWithErrorMessages
    {
        [Key]
        public ProcessCreateGet Process { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
