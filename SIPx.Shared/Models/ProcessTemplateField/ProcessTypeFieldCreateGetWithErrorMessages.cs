using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeFieldCreateGet ProcessTypeField { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
