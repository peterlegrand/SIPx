using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueRoleCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueRoleCreateGet ClassificationValueRole { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
