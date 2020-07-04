using System;

namespace SIPx.Shared
{
    public interface IClassificationIndexGet
    {
        int ClassificationId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        int DefaultPageId { get; set; }
        string DefaultPageName { get; set; }
        string Description { get; set; }
        int DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        string MenuName { get; set; }
        string ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string StatusName { get; set; }
    }
}