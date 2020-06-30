namespace SIPx.Shared
{
    public interface IProcessTemplateStageCreatePost
    {
        string Description { get; set; }
        bool IsEndStage { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateTypeId { get; set; }
        string UserId { get; set; }
    }
}