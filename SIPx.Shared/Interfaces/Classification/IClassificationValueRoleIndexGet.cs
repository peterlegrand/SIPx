using System;

namespace SIPx.Shared
{
    public interface IClassificationValueRoleIndexGet
    {
        int ClassificationRelationTypeId { get; set; }
        int ClassificationValueId { get; set; }
        int ClassificationValueRoleId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string RoleId { get; set; }
    }
}