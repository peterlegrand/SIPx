﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class TelecomTypeList
    {
        [Key]
        public string TelecomTypeId { get; set; }
        public string Name { get; set; }

    }
}
