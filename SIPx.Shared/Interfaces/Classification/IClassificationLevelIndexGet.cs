using System;

namespace SIPx.Shared
{
    public interface IClassificationLevelIndexGet
    {
        bool Alphabetically { get; set; }
        bool CanLink { get; set; }
        int ClassificationId { get; set; }
        int ClassificationLevelId { get; set; }
        int ClassificationLevelLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        int DateLevelId { get; set; }
        string Description { get; set; }
        bool InDropDown { get; set; }
        bool InMenu { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        bool OnTheFly { get; set; }
        int Sequence { get; set; }
    }
}