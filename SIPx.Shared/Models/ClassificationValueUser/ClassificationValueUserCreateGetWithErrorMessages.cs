using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationValueUserCreateGet ClassificationValueUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
