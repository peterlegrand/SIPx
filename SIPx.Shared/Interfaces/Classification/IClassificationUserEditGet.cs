using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationUserEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
        int ClassificationUserId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        List<RoleList> Statuses { get; set; }
        string UserId { get; set; }
    }
}