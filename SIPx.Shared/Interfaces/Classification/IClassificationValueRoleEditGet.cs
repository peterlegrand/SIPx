using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationValueRoleEditGet
    {
        int ClassificationRelationTypeId { get; set; }
        List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
        int ClassificationValueId { get; set; }
        int ClassificationValueRoleId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string RoleId { get; set; }
        List<RoleList> Roles { get; set; }
    }
}