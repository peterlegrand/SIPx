using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontPersonDashboardOrganization
    {
        [Key]
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }

    }
}
