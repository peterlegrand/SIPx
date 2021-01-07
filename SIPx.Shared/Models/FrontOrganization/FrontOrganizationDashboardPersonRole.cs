using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontOrganizationDashboardPersonRole
    {
        [Key]
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public string UserId { get; set; }
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int DefaultOrganizationId { get; set; }
        public string OrganizationName { get; set; }

    }
}
