﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTelecomUpdateGetWithErrorMessages
    {
        [Key]
        public OrganizationTelecomUpdateGet OrganizationTelecomUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
