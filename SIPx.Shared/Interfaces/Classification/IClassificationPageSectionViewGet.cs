using System;

namespace SIPx.Shared
{
    public interface IClassificationPageSectionViewGet
    {
        int ClassificationId { get; set; }
        string ClassificationName { get; set; }
        int ClassificationPageId { get; set; }
        string ClassificationPageName { get; set; }
        int ClassificationPageSectionId { get; set; }
        string ContentTypeName { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        bool DefaultClassificationPageSectionLanguage { get; set; }
        bool DefaultContentTypeLanguage { get; set; }
        bool DefaultPageSectionTypeLanguage { get; set; }
        bool DefaultSortByLanguage { get; set; }
        string Description { get; set; }
        bool HasContentType { get; set; }
        bool HasPaging { get; set; }
        int MaxContent { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string PageSectionTypeName { get; set; }
        int Sequence { get; set; }
        bool ShowContentTypeTitleDescription { get; set; }
        bool ShowContentTypeTitleName { get; set; }
        bool ShowSectionTitleDescription { get; set; }
        bool ShowSectionTitleName { get; set; }
        string SortByName { get; set; }
    }
}