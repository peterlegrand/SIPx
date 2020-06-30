namespace SIPx.Shared
{
    public interface IClassificationRoleCreatePost
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        string RoleId { get; set; }
        string UserId { get; set; }
    }
}