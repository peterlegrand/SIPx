namespace SIPx.Shared
{
    public interface IClassificationValueRoleCreatePost
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        int ClassificationValueId { get; set; }
        string RoleId { get; set; }
        string UserId { get; set; }
    }
}