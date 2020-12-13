using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessUpdateGetWithErrorMessages
    {
        [Key]
      //  public ProcessUpdateGet Process { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
