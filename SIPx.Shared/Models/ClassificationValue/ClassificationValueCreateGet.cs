using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueCreateGet
    {
        [Key]
        public int ClassificationId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public int? ParentId { get; set; }
        public string ParentName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string Location { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string DropDownName { get; set; }
        public string PageName { get; set; }
        public string PageDescription { get; set; }
        public string HeaderName { get; set; }
        public string HeaderDescription { get; set; }
        public string TopicName { get; set; }
        public int DateLevel { get; set; }
        public string UserId { get; set; }
    }
}
