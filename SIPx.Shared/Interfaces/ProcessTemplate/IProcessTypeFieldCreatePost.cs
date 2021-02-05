namespace SIPx.Shared
{
    public interface IProcessTypeFieldCreatePost
    {
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeFieldTypeId { get; set; }
        int ProcessTypeId { get; set; }
        string UserId { get; set; }
    }
}