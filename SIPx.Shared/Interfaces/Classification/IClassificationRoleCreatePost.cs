namespace SIPx.Shared
{
    public interface IClassificationRoleCreatePost
    {
        int ClassificationID { get; set; }
        int ClassificationRelationTypeID { get; set; }
        string RoleID { get; set; }
        string UserId { get; set; }
    }
}