using System;

namespace SIPx.Shared
{
    public interface IClassificationViewGet
    {
        int ClassificationId { get; set; }
        string Name { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string StatusName { get; set; }
        bool HasDropDown { get; set; }
        int DropDownSequence { get; set; }
    }
}