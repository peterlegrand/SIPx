namespace SIPx.Shared
{
    public interface IPageCreatePost
    {
        string Description { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        bool ShowTitleDescription { get; set; }
        bool ShowTitleName { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
        string UserId { get; set; }
    }
}