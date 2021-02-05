namespace SIPx.Shared
{
    public interface IProcessTypeStageCreatePost
    {
        string Description { get; set; }
        bool InToDo { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeStageTypeId { get; set; }
        string UserId { get; set; }
    }
}