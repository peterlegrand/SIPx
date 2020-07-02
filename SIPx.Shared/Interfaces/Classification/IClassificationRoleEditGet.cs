using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationRoleEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
        int ClassificationRoleId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string RoleId { get; set; }
        List<RoleList> Roles { get; set; }
    }
}