﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessTemplateList : INewProcessTemplateList
    {
        public int ProcessTemplateId { get; set; }
        [Key]
        public int ProcessTemplateGroupId { get; set; }
        public string Name { get; set; }
        public string FileName { get; set; }
    }
}
