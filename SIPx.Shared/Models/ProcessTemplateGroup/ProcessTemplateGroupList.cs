﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateGroupList
    {
        [Key]
        public int ProcessTemplateGroupId { get; set; }
        public string Name { get; set; }

    }
}
