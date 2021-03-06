﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeIndexGet
    {
        [Key]
        public int ContentTypeId { get; set; }
        public int GroupSequence { get; set; }
        public int ContentTypeGroupId { get; set; }
        public string ContentTypeGroupName { get; set; }
        public int LanguageIf { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int SecurityLevelId { get; set; }
        public string SecurityLevelName { get; set; }
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public string Color { get; set; }
        public string IconName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
