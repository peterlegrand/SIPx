namespace SIPx.Shared
{
    public interface IContentType
    {
        int ContentTypeId { get; set; }
        string Description { get; set; }
        string GroupName { get; set; }
        int LanguageId { get; set; }
        string LanguageName { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeId { get; set; }
        string ProcessTypeName { get; set; }
        string SecurityLevelName { get; set; }
    }
}