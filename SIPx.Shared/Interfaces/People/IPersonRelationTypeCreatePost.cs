namespace SIPx.Shared
{
    public interface IPersonRelationTypeCreatePost
    {
        string Description { get; set; }
        string FromIsAnXOfTo { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string ToIsAnXOfFrom { get; set; }
        string UserId { get; set; }
    }
}