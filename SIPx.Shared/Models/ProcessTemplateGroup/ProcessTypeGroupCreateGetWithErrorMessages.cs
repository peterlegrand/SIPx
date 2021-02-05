using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeGroupCreateGetWithErrorMessages
    {
        [Key]
        public ProcessTypeGroupCreateGet ProcessTypeGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
