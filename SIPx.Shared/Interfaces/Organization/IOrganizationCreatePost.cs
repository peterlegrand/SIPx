namespace SIPx.Shared
{
    public interface IOrganizationCreatePost
    {
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OrganizationTypeId { get; set; }
        int? ParentOrganizationId { get; set; }
        int StatusId { get; set; }
        string UserId { get; set; }
    }
}