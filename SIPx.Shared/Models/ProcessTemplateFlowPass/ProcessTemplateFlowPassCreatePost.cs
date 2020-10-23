﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassCreatePost 
    {
        [Key]
        public int ProcessTemplateFlowId { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowPassTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTemplateFlowPassString { get; set; }
        public int ProcessTemplateFlowPassInt { get; set; }
        public DateTime ProcessTemplateFlowPassDate { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreaterId { get; set; }
        public string UserId { get; set; }
    }
}