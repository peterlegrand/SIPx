using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateCreateGet
    {
        [Key]
        public int ProcessTemplateGroupId { get; set; }
        public bool ShowInPersonalCalendar { get; set; }
        public bool ShowInOrganizationCalendar { get; set; }
        public bool ShowInProjectCalendar { get; set; }
        public bool ShowInEventCalendar { get; set; }
        public int ProcessMultiMax { get; set; }
        public int Sequence { get; set; }
        public bool IsPersonal { get; set; }
        public bool ShowInNew { get; set; }
        public bool ShowInSearch { get; set; }
        public bool ShowInReports { get; set; }
        public bool HideEverywhere { get; set; }
        public string Color { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }

        public List<SequenceList> ProcessTemplates { get; set; }
        public List<ProcessTemplateGroupList> ProcessTemplateGroups{ get; set; }
    }
}
