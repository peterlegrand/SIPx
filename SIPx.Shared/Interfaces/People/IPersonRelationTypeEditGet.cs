using System;

namespace SIPx.Shared
{
    public interface IPersonRelationTypeEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string FromIsAnXOfTo { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int PersonRelationTypeId { get; set; }
        int PersonRelationTypeLanguageId { get; set; }
        string ToIsAnXOfFrom { get; set; }
    }
}