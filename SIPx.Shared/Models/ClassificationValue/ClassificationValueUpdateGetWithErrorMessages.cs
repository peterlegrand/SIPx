using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueUpdateGet ClassificationValue { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
