using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationUserUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationUserUpdateGet ClassificationUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
