using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionUpdateGetWithErrorMessages
    {
        [Key]
        public PageSectionUpdateGet PageSection { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
