using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.Models
{
    public class SipRole: IdentityRole
    {

        public int RoleGroupId { get; set; }
        public int? OrganizationId { get; set; }
        public int? ProjectId { get; set; }
    }
}
