using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRoleUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationRoleUpdateGet ClassificationRole { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
