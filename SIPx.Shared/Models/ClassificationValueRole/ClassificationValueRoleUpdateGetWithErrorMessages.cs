using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueRoleUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueRoleUpdateGet ClassificationValueRole { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
