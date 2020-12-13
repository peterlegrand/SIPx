using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueUserUpdateGet ClassificationValueUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
