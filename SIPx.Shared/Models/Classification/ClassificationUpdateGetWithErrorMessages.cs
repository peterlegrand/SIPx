using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationUpdateGet Classification { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
