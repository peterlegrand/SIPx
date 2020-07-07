using System;

namespace SIPx.Shared
{
    public interface IClassificationRelationTypeIndexGet
    {
        int ClassificationRelationTypeId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
    }
}