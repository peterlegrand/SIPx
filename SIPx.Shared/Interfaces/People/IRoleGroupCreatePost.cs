namespace SIPx.Shared
{
    public interface IRoleGroupCreatePost
    {
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int Sequence { get; set; }
        string UserId { get; set; }
    }
}