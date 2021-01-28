using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelUpdateGet 
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public string CodePrefix { get; set; }
        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        public int ClassificationLevelLanguageId { get; set; }
        public int ClassificationId { get; set; }
        public int Sequence { get; set; }
        public int DateLevelId { get; set; }
        public bool OnTheFly { get; set; }
        public bool Alphabetically { get; set; }
        public bool CanLink { get; set; }
        public bool InDropDown { get; set; }
        public bool InMenu { get; set; }
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

        public List<DateLevelList> DateLevels { get; set; }
        public List<SequenceList> Sequences { get; set; }

    }
}
