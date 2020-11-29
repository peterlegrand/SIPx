using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageSectionLanguageCreateGet
    {
        [Key]
        public int ClassificationPageSectionId { get; set; }
        public int ClassificationPageId { get; set; }
        public string ClassificationPageName { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string UserId { get; set; }
        public List<LanguageList> Languages { get; set; }
    }
}
