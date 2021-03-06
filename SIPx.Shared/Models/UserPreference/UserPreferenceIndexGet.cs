﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserPreferenceIndexGet
    {
        [Key]
        public int UserPreferenceId { get; set; }
        public string UserPreferenceTypeName { get; set; }
        public string UserPreferenceName { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifierDate { get; set; }
    }
}
