﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeIndexGet
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public int ProcessTypeGroupId { get; set; }
        public int ProcessTypeGroupName { get; set; }
        public string ProcessTypeLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public bool ShowInPersonalCalendar { get; set; }
        public bool ShowInEventCalendar { get; set; }
        public int ProcessMultiMax { get; set; }
        public int Sequence { get; set; }
        public bool IsPersonal { get; set; }
        public bool ShowInNew { get; set; }
        public bool ShowInSearch { get; set; }
        public bool ShowInReports { get; set; }
        public bool HideEverywhere { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public string IconName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
