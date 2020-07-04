using System;

namespace SIPx.Shared
{
    public interface IClassificationRelationTypeEditGet
    {
        int ClassificationRelationTypeId { get; set; }
        int ClassificationRelationTypeLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
    }
}