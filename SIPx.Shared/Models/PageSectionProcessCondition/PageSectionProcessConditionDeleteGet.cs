﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionDeleteGet
    {
        [Key]
        public int PageSectionProcessConditionId { get; set; }
        public int PageSectionId { get; set; }
        public int PageId { get; set; }
        public string PageSectionProcessConditionTypeName { get; set; }
        public string PageSectionProcessConditionName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}
