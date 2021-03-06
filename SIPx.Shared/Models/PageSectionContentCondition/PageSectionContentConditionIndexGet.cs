﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionContentConditionIndexGet
    {
        [Key]
        public int PageSectionContentConditionId { get; set; }
        public int PageSectionId { get; set; }
        public int PageId { get; set; }
        public string PageSectionContentConditionTypeName { get; set; }
        public string PageSectionContentConditionName { get; set; }
        public string ClassificationName { get; set; }
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

    }
}
