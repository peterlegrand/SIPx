﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuTypeList
    {
        [Key]
        public int UserMenuTypeId { get; set; }
        public string Name { get; set; }
        }
}
