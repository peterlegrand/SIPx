namespace SIPx.Shared
{
    public interface IProcessTemplateFieldCreatePost
    {
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldTypeId { get; set; }
        int ProcessTemplateId { get; set; }
        string CreatorId { get; set; }
    }
}