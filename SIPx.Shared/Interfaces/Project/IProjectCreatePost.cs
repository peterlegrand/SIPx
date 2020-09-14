namespace SIPx.Shared
{
    public interface IProjectCreatePost
    {
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ParentProjectId { get; set; }
        int ProjectTypeId { get; set; }
        int StatusId { get; set; }
        string CreatorId { get; set; }
        int SecurityLevelId { get; set; }
    }
}