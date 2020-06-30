using System;

namespace SIPx.Shared
{
    public interface IPersonRelationCreatePost
    {
        int FromPersonId { get; set; }
        int PersonRelationTypeId { get; set; }
        int ToPersonId { get; set; }
        string UserId { get; set; }
        DateTime ValidFrom { get; set; }
        DateTime ValidTill { get; set; }
    }
}