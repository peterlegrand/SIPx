namespace SIPx.Shared
{
    public interface IClassificationValueRoleCreatePost
    {
        int ClassificationID { get; set; }
        int ClassificationRelationTypeID { get; set; }
        int ClassificationValueID { get; set; }
        string RoleID { get; set; }
        string UserId { get; set; }
    }
}