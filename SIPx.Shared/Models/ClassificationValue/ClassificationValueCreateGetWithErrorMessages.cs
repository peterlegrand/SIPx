using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueCreateGet ClassificationRelationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
