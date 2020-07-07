using System;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLanguageCreate
    {
        [Key]
        public int ClassificationId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
    }
}
