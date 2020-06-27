namespace SIPx.Shared
{
    public interface IPageSectionCreatePost
    {
        int? ContentTypeID { get; set; }
        string Description { get; set; }
        bool HasPaging { get; set; }
        int LanguageID { get; set; }
        int MaxContent { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OneTwoColumns { get; set; }
        int PageID { get; set; }
        int PageSectionDataTypeID { get; set; }
        int PageSectionTypeID { get; set; }
        int Sequence { get; set; }
        bool ShowContentTypeTitleDescription { get; set; }
        bool ShowContentTypeTitleName { get; set; }
        bool ShowSectionTitleDescription { get; set; }
        bool ShowSectionTitleName { get; set; }
        int SortByID { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
        string UserId { get; set; }
    }
}