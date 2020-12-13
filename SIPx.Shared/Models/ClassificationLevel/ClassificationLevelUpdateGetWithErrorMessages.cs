using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationLevelUpdateGet ClassificationLevel { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
