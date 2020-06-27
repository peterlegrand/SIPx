using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageViewGet : IClassificationPageViewGet
    {
        [Key]
        public int ClassificationPageId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string Creator { get; set; }
        public string Modifier { get; set; }
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public bool DefaultClassificationPageLanguage { get; set; }
        public string StatusName { get; set; }
        public bool DefaultStatusLanguage { get; set; }

    }
}
