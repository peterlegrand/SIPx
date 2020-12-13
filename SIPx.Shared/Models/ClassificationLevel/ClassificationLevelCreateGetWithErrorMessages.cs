using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationLevelCreateGet ClassificationLevel { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
