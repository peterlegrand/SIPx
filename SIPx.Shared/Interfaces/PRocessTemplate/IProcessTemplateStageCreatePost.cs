namespace SIPx.Shared
{
    public interface IProcessTemplateStageCreatePost
    {
        string Description { get; set; }
        bool InToDo { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateStageTypeId { get; set; }
        string UserId { get; set; }
    }
}