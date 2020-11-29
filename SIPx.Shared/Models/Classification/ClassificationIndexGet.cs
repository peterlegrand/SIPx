using System;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationIndexGet 
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ClassificationLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string StatusName { get; set; }
        public string DefaultPageName { get; set; }
        public int DefaultPageId { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public string Color { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

    }
}
