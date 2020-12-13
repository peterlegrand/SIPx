using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationUserCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationUserCreateGet ClassificationUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
