using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelCreateGet
    {
        [Key]
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int Sequence { get; set; }
        public int DateLevelId { get; set; }
        public bool OnTheFly { get; set; }
        public bool Alphabetically { get; set; }
        public bool CanLink { get; set; }
        public bool InDropDown { get; set; }
        public bool InMenu { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<DateLevelList> DateLevels { get; set; }
        public List<SequenceList> Sequences { get; set; }
    }
}
