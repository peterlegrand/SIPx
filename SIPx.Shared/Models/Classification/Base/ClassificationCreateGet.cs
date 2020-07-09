﻿using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationCreateGet : IClassificationCreateGet
    {
        [Key]
        public int StatusId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public bool HasDropDown { get; set; }
        public bool DropDownSequence { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }

        public List<StatusList> Statuses { get; set; }
        public List<ClassificationCreateGetSequence> Sequences { get; set; }

    }
}