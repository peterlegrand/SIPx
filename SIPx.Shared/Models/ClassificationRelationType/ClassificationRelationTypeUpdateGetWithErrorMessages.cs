using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRelationTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationRelationTypeUpdateGet ClassificationRelationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
