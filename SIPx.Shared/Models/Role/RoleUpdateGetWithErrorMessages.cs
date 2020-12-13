using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleUpdateGetWithErrorMessages
    {
        [Key]
        public RoleUpdateGet Role { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
