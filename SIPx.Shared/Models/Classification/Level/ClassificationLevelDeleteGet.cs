using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelDeleteGet
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public int ClassificationId { get; set; }
        public string DateLevelName { get; set; }
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
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
