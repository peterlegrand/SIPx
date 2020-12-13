using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleGroupUpdateGetWithErrorMessages
    {
        [Key]
        public RoleGroupUpdateGet RoleGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
