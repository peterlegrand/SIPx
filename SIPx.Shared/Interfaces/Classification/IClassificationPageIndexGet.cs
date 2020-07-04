using System;

namespace SIPx.Shared
{
    public interface IClassificationPageIndexGet
    {
        int ClassificationPageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        bool ShowTitleDescription { get; set; }
        bool ShowTitleName { get; set; }
        string StatusName { get; set; }
        string TitleDescription { get; set; }
        string TitleName { get; set; }
    }
}