using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionIndexGet 
    {
        [Key]
        public int PageSectionId { get; set; }
        public int PageSectionLanguageId { get; set; }
        public int PageId { get; set; }
        public string PageName { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int Sequence { get; set; }
        public bool ShowSectionTitleName { get; set; }
        public bool ShowSectionTitleDescription { get; set; }
        public bool ShowContentTypeTitleName { get; set; }
        public bool ShowContentTypeTitleDescription { get; set; }
        public int MaxContent { get; set; }
        public bool HasPaging { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string PageSectionTypeName { get; set; }
        public string PageSectionDataTypeName { get; set; }
        public int ContentTypeId { get; set; }
        public int PageSectionDataTypeId { get; set; }
        public string ContentTypeName { get; set; }
        public string SortByName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
