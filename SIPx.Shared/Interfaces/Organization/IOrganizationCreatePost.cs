namespace SIPx.Shared
{
    public interface IOrganizationCreatePost
    {
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OrganizationTypeID { get; set; }
        int? ParentOrganizationID { get; set; }
        int StatusID { get; set; }
        string UserId { get; set; }
    }
}