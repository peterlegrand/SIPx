using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueForPanelCondition
    {
        [Key]
        public int PageSectionClassificationValueConditionId { get; set; }
        public int PageSectionClassificationValueConditionTypeId { get; set; }
        public int PageSectionClassificationValueConditionInt { get; set; }
        public string PageSectionClassificationValueConditionString { get; set; }
        public DateTime PageSectionClassificationValueConditionDate { get; set; }

    }
}
