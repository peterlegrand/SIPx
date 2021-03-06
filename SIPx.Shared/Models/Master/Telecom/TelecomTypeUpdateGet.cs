﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class TelecomTypeUpdateGet
    {
        [Key]
        public int TelecomTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public bool PhoneProperties { get; set; }
        public int StatusId { get; set; }
        public string ModifierId { get; set; }
    }
}
