using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelCreatePost : IClassificationLevelCreatePost
    {
        [Key]
        public int ClassificationId { get; set; }
        public int Sequence { get; set; }
        public int DateLevelId { get; set; }
        public bool OnTheFly { get; set; }
        public bool Alhpabetically { get; set; }
        public bool CanLink { get; set; }
        public bool InDropDown { get; set; }
        public bool InMenu { get; set; }
        public int LanguageID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
    }
}
