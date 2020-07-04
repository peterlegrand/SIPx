using System;

namespace SIPx.Shared
{
    public interface IClassificationRoleIndexGet
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        int ClassificationRoleId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string RoleId { get; set; }
    }
}