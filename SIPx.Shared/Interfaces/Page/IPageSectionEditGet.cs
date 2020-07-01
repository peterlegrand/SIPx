using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IPageSectionEditGet
    {
        int? ContentTypeId { get; set; }
        List<ContentTypeList> ContentTypes { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        bool HasPaging { get; set; }
        int? MaxContent { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OneTwoColumns { get; set; }
        int PageId { get; set; }
        int PageSectionDataTypeId { get; set; }
        List<PageSectionDataTypeList> PageSectionDataTypes { get; set; }
        int PageSectionId { get; set; }
        int PageSectionLanguageId { get; set; }
        int PageSectionTypeId { get; set; }
        List<PageSectionTypeList> PageSectionTypes { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
        bool ShowContentTypeTitleDescription { get; set; }
        bool ShowContentTypeTitleName { get; set; }
        bool ShowTitleDescription { get; set; }
        bool ShowTitleName { get; set; }
        int SortById { get; set; }
        List<SortByList> SortBys { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
    }
}