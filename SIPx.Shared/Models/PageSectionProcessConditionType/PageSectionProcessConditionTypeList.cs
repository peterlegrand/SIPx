﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionTypeList
    {
        [Key]
        public int PageSectionConsitionTypeId { get; set; }
        public string Name { get; set; }
    }
}
