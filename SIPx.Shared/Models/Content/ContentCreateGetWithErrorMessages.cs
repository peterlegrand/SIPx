using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentCreateGetWithErrorMessages
    {
        [Key]
        public ContentCreateGet Content { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
