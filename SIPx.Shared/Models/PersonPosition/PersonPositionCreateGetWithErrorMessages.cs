﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonPositionCreateGetWithErrorMessages
    {
        [Key]
        public PersonPositionCreateGet PersonPosition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
