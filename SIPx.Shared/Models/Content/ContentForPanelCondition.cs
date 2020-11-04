using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentForPanelCondition
    {
        [Key]
        public int PageSectionContentConditionId { get; set; }
        public int PageSectionContentConditionTypeId { get; set; }
        public int PageSectionContentConditionInt { get; set; }
        public string PageSectionContentConditionString { get; set; }
        public DateTime PageSectionContentConditionDate { get; set; }

    }
}
