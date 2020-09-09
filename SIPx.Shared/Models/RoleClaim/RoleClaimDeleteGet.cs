using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class RoleClaimDeleteGet
    {
        [Key]
        public int RoleClaimId { get; set; }
        public string RoleId { get; set; }
        public string ClaimGroupName { get; set; }
        public string ClaimName { get; set; }
        public string RoleName { get; set; }

    }
}
