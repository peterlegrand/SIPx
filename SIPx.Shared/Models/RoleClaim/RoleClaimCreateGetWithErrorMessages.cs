using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleClaimCreateGetWithErrorMessages
    {
        [Key]
        public RoleClaimCreateGet RoleClaim { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
