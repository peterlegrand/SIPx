namespace SIPx.Shared
{
    public interface IProcessTemplateStageCreatePost
    {
        string Description { get; set; }
        bool IsEndStage { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateID { get; set; }
        int ProcessTemplateTypeID { get; set; }
        string UserID { get; set; }
    }
}