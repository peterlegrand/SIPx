using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonForPanelCondition
    {
        [Key]
        public int PageSectionPersonConditionId { get; set; }
        public int PageSectionPersonConditionTypeId { get; set; }
        public int PageSectionPersonConditionInt { get; set; }
        public string PageSectionPersonConditionString { get; set; }
        public DateTime PageSectionPersonConditionDate { get; set; }

    }
}
