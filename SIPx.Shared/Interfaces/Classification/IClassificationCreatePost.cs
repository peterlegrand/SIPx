﻿namespace SIPx.Shared
{
    public interface IClassificationCreatePost
    {
        string Description { get; set; }
        int DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int StatusId { get; set; }
        string UserId { get; set; }
    }
}