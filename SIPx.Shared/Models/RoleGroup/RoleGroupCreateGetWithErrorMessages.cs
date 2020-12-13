using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleGroupCreateGetWithErrorMessages
    {
        [Key]
        public RoleGroupCreateGet RoleGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
