using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionCreateGetWithErrorMessages
    {
        [Key]
        public PageSectionProcessConditionCreateGet PageSectionProcessCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
