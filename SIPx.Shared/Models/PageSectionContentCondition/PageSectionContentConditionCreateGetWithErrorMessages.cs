using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionContentConditionCreateGetWithErrorMessages
    {
        [Key]
        public PageSectionContentConditionCreateGet PageSectionContentCondition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
