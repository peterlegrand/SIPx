﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageCreatePost : IProcessTemplateStageCreatePost
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateStageTypeId { get; set; }
        public bool InToDo { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
    }
}
