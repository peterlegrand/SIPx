﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserMenuTemplateOptionCreateGetWithErrorMessages
    {
        [Key]
        public UserMenuTemplateOptionCreateGet UserMenuTemplateOption { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
