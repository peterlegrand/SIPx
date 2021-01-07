using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontPersonDashboardOrganizationPosition
    {
        [Key]
        public int OrganizationPersonId { get; set; }
        public int PositionId { get; set; }
        public string PositionName { get; set; }
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }

    }
}
