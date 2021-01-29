using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateUpdateGet 
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public string CodePrefix { get; set; }
        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        public int ProcessTemplateGroupId { get; set; }
        public int ProcessTemplateLanguageId { get; set; }
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
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<ProcessTemplateGroupList> ProcessTemplateGroups { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<IconList> Icons { get; set; }
        public List<CodeTypeList> CodeTypes { get; set; }

    }
}
