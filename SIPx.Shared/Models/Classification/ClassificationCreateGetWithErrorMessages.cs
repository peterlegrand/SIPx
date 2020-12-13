using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationCreateGet Classification { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
