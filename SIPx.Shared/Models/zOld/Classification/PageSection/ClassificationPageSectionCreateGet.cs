﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageSectionCreateGet 
    {
        [Key]
        public int ClassificationPageId { get; set; }
        public string ClassificationPageName { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int Sequence { get; set; }
        public int PageSectionTypeId { get; set; }
        public int PageSectionDataTypeId { get; set; }
        public bool ShowSectionTitleName { get; set; }
        public bool ShowSectionTitleDescription { get; set; }
        public bool ShowContentTypeTitleName { get; set; }
        public bool ShowContentTypeTitleDescription { get; set; }
        public int OneTwoColumns { get; set; }
        public int ContentTypeId { get; set; }
        public int SortById { get; set; }
        public int MaxContent { get; set; }
        public bool HasPaging { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string UserId { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<PageSectionTypeList> PageSectionTypes { get; set; }
        public List<PageSectionDataTypeList> PageSectionDataTypes { get; set; }
        public List<ContentTypeList> ContentTypes { get; set; }
        public List<SortByList> SortBys { get; set; }
    }
}
