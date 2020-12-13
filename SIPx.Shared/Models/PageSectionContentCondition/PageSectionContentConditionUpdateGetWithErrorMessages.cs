using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionContentConditionUpdateGetWithErrorMessages
    {
        [Key]
        public PageSectionContentConditionUpdateGet PageSectionContentCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
