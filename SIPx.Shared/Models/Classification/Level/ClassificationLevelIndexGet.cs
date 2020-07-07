using System;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelIndexGet 
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public int ClassificationLevelLanguageId { get; set; }
        public int ClassificationId { get; set; }
        public int Sequence { get; set; }
        public int DateLevelId { get; set; }
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
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
