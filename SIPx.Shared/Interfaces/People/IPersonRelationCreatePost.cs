using System;

namespace SIPx.Shared
{
    public interface IPersonRelationCreatePost
    {
        int FromPersonID { get; set; }
        int PersonRelationTypeID { get; set; }
        int ToPersonID { get; set; }
        string UserId { get; set; }
        DateTime ValidFrom { get; set; }
        DateTime ValidTill { get; set; }
    }
}