using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationLevelPropertyCreateGet ClassificationLevelProperty { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
