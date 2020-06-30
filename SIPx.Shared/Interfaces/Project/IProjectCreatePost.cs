namespace SIPx.Shared
{
    public interface IProjectCreatePost
    {
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProjectParentId { get; set; }
        int StatusId { get; set; }
        string UserId { get; set; }
    }
}