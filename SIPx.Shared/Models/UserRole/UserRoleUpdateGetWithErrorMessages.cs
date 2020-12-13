using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserRoleUpdateGetWithErrorMessages
    {
        [Key]
        public UserRoleUpdateGet UserRole { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
