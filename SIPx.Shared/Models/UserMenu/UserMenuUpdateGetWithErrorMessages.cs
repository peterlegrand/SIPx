using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuUpdateGetWithErrorMessages
    {
        [Key]
        public UserMenuUpdateGet UserMenu { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
