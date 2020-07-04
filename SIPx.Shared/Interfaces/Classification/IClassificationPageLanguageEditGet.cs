using System;

namespace SIPx.Shared
{
    public interface IClassificationPageLanguageEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationPageId { get; set; }
        int ClassificationPageLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string Language { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
    }
}