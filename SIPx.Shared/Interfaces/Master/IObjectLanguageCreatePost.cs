namespace SIPx.Shared
{
    public interface IObjectLanguageCreatePost
    {
        string CreatorId { get; set; }
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ObjectId { get; set; }
    }
}