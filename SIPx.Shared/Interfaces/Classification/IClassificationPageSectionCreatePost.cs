namespace SIPx.Shared
{
    public interface IClassificationPageSectionCreatePost
    {
        int ClassificationId { get; set; }
        int ClassificationPageId { get; set; }
        int ContentTypeId { get; set; }
        string UserId { get; set; }
        string Description { get; set; }
        bool HasPaging { get; set; }
        int LanguageId { get; set; }
        int MaxContent { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OenTwoColumns { get; set; }
        int PageSectionDataTypeId { get; set; }
        int PageSectionTypeId { get; set; }
        int Sequence { get; set; }
        bool ShowContentTypeTitleDescription { get; set; }
        bool ShowContentTypeTitleName { get; set; }
        bool ShowSectionTitleDescription { get; set; }
        bool ShowSectionTitleName { get; set; }
        int SortById { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
    }
}