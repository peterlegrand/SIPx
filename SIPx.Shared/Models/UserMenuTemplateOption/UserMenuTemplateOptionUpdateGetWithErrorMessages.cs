using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuTemplateOptionUpdateGetWithErrorMessages
    {
        [Key]
        public UserMenuTemplateOptionUpdateGet UserMenuTemplateOption { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
