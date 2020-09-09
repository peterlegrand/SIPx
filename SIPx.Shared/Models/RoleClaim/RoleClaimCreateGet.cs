using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class RoleClaimCreateGet
    {
        [Key]
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public string ClaimId { get; set; }
        public string CreatorId { get; set; }
        public List<ClaimList> Claims { get; set; }
    }
}
