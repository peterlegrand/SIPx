using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeGroupUpdateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeGroupUpdateGet ProcessTypeGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
