using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessForPanelCondition
    {
        [Key]
        public int PageSectionProcessConditionId { get; set; }
        public int PageSectionProcessConditionTypeId { get; set; }
        public int PageSectionProcessConditionInt { get; set; }
        public string PageSectionProcessConditionString { get; set; }
        public DateTime PageSectionProcessConditionDate { get; set; }

    }
}
