﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationAddressCreateGetWithErrorMessages
    {
        [Key]
        public OrganizationAddressCreateGet OrganizationAddress { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
