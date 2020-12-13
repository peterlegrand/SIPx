using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageCreateGetWithErrorMessages
    {
        [Key]
        public PageCreateGet Page { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
