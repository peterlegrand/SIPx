namespace SIPx.Shared
{
    public interface IClassificationLevelCreatePost
    {
        bool Alhpabetically { get; set; }
        bool CanLink { get; set; }
        int ClassificationId { get; set; }
        string UserId { get; set; }
        int DateLevelId { get; set; }
        string Description { get; set; }
        bool InDropDown { get; set; }
        bool InMenu { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        bool OnTheFly { get; set; }
        int Sequence { get; set; }
    }
}