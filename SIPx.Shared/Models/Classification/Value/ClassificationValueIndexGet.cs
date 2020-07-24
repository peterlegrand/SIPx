using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueIndexGet 
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public int ClassificationValueLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int? ParentId { get; set; }
        public string ParentName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string PageName { get; set; }
        public string PageDescription { get; set; }
        public string HeaderName { get; set; }
        public string HeaderDescription { get; set; }
        public string TopicName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int MaxLevel { get; set; }
        public int Level { get; set; }

    }
}
