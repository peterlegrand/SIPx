namespace SIPx.Shared
{
    public interface IProcessTypeFlowCreatePost
    {
        int Alhpabetically { get; set; }
        int CanLink { get; set; }
        int DateLevelId { get; set; }
        string Description { get; set; }
        int InDropDow { get; set; }
        int InMenu { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OnTheFly { get; set; }
        int ProcessTypeFromStageId { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeToStageId { get; set; }
        string UserId { get; set; }
    }
}