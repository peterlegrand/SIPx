using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyUpdateGetWithErrorMessages
    {
        [Key]
        public ClassificationLevelPropertyUpdateGet ClassificationLevelProperty { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
