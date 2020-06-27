namespace SIPx.Shared
{
    public interface IProcessTemplateFlowCreatePost
    {
        int Alhpabetically { get; set; }
        int CanLink { get; set; }
        int DateLevelID { get; set; }
        string Description { get; set; }
        int InDropDow { get; set; }
        int InMenu { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OnTheFly { get; set; }
        int ProcessTemplateFromStageID { get; set; }
        int ProcessTemplateID { get; set; }
        int ProcessTemplateToStageID { get; set; }
        string UserID { get; set; }
    }
}