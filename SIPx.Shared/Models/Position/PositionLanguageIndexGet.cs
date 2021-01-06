using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PositionLanguageIndexGet
    {
        [Key]
        public int PositionLanguageId { get; set; }
        public int PositionId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public string LanguageName { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
