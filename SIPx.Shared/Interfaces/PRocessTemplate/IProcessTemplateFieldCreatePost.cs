namespace SIPx.Shared
{
    public interface IProcessTemplateFieldCreatePost
    {
        string Description { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldTypeID { get; set; }
        int ProcessTemplateID { get; set; }
        string UserID { get; set; }
    }
}