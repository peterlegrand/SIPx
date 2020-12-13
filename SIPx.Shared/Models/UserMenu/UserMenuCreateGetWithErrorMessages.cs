using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuCreateGetWithErrorMessages
    {
        [Key]
        public UserMenuCreateGet UserMenu { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
