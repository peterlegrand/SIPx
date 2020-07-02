using System;

namespace SIPx.Shared
{
    public interface IClassificationLanguageEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string Language { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
    }
}