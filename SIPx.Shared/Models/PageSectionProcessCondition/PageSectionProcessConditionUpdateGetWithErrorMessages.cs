using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionUpdateGetWithErrorMessages
    {
        [Key]
        public PageSectionProcessConditionUpdateGet PageSectionProcessCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
