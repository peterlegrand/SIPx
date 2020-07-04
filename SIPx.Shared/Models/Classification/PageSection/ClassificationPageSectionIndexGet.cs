using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageSectionImndexGet : IClassificationPageSectionImndexGet
    {
        [Key]
        public int ClassificationPageSectionId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int ClassificationPageId { get; set; }
        public string ClassificationPageName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string Creator { get; set; }
        public string Modifier { get; set; }
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
        public bool DefaultClassificationPageSectionLanguage { get; set; }
        public string PageSectionTypeName { get; set; }
        public bool DefaultPageSectionTypeLanguage { get; set; }
        public string ContentTypeName { get; set; }
        public bool DefaultContentTypeLanguage { get; set; }
        public bool HasContentType { get; set; }
        public string SortByName { get; set; }
        public bool DefaultSortByLanguage { get; set; }

    }
}
