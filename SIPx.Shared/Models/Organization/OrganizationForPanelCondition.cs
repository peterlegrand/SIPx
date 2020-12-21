using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationForPanelCondition
    {
        [Key]
        public int PageSectionOrganizationConditionId { get; set; }
        public int PageSectionOrganizationConditionTypeId { get; set; }
        public int PageSectionOrganizationConditionInt { get; set; }
        public string PageSectionOrganizationConditionString { get; set; }
        public DateTime PageSectionOrganizationConditionDate { get; set; }

    }
}
