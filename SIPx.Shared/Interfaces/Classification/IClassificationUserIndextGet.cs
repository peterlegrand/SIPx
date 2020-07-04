using System;

namespace SIPx.Shared
{
    public interface IClassificationUserIndextGet
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        int ClassificationUserId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string UserId { get; set; }
    }
}