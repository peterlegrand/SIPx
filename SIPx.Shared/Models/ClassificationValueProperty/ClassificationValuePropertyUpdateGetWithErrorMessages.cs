using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValuePropertyUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationValuePropertyUpdateGet ClassificationValueProperty { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
