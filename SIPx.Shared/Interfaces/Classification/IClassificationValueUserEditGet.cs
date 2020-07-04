using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationValueUserEditGet
    {
        int ClassificationRelationTypeId { get; set; }
        List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
        int ClassificationValueId { get; set; }
        int ClassificationValueUserId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string UserId { get; set; }
        List<UserList> Users { get; set; }
    }
}