﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessDeleteGet
    {
        [Key]
        public int ProcessId { get; set; }
        public string Subject { get; set; }
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateStageId { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}