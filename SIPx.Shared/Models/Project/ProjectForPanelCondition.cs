using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectForPanelCondition
    {
        [Key]
        public int PageSectionProjectConditionId { get; set; }
        public int PageSectionProjectConditionTypeId { get; set; }
        public int PageSectionProjectConditionInt { get; set; }
        public string PageSectionProjectConditionString { get; set; }
        public DateTime PageSectionProjectConditionDate { get; set; }

    }
}
