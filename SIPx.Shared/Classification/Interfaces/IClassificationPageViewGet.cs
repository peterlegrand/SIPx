using System;

namespace SIPx.DataAccess
{
    public interface IClassificationPageViewGet
    {
        int ClassificationId { get; set; }
        string ClassificationName { get; set; }
        int ClassificationPageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        bool DefaultClassificationPageLanguage { get; set; }
        bool DefaultStatusLanguage { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        bool ShowTitleDescription { get; set; }
        bool ShowTitleName { get; set; }
        string StatusName { get; set; }
    }
}