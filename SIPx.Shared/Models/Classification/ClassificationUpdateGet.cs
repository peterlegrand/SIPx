﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationUpdateGet 
    {
        [Key]
        public int ClassificationId { get; set; }
        public int StatusId { get; set; }
        public int? DefaultPageId { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public int ClassificationLanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<StatusList> Statuses { get; set; }
        public List<ClassificationPageList> DefaultPages { get; set; }
        public List<SequenceList> DropDownSequences { get; set; }
        public List<IconList> Icons { get; set; }

    }
}
