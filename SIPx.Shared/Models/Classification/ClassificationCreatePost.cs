using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationCreatePost : IClassificationCreatePost
    {
        [Key]
        public int LanguageId { get; set; }
        public int StatusId { get; set; }
        public int DefaultPageId { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public string CreatorId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
    }
}
