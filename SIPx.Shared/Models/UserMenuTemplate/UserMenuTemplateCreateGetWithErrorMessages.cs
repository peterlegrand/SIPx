using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuTemplateCreateGetWithErrorMessages
    {
        [Key]
        public UserMenuTemplateCreateGet UserMenuTemplate { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
