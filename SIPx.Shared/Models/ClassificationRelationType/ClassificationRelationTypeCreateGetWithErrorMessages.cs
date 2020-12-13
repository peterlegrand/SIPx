using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRelationTypeCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationRelationTypeCreateGet ClassificationRelationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
