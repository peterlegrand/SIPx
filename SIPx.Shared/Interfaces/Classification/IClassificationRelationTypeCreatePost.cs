namespace SIPx.Shared
{
    public interface IClassificationRelationTypeCreatePost
    {
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string USerId { get; set; }
    }
}