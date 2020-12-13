using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuTemplateUpdateGetWithErrorMessages
    {
        [Key]
        public UserMenuTemplateUpdateGet UserMenuTemplate { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
