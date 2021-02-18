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
        //public bool CanAssignContentOwnership { get; set; }
        //public bool CanReceiveContentOwnership { get; set; }
        //public bool CanAssignContentRead { get; set; }
        //public bool CanReceiveContentRead { get; set; }
        //public bool CanAssignContentEdit { get; set; }
        //public bool CanReceiveContentEdit { get; set; }
    }
   
}
