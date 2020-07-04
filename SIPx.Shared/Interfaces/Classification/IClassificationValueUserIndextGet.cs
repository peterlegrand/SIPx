using System;

namespace SIPx.Shared
{
    public interface IClassificationValueUserIndextGet
    {
        int ClassificationRelationTypeId { get; set; }
        int ClassificationValueId { get; set; }
        int ClassificationValueUserId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string UserId { get; set; }
    }
}