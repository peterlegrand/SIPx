using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValuePropertyCreateGetWithErrorMessages
    {
        [Key]
        public ClassificationValuePropertyCreateGet ClassificationValueProperty { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
