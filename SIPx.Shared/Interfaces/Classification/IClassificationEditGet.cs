using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        int? DefaultPageId { get; set; }
        List<ClassificationPageList> DefaultPages { get; set; }
        string Description { get; set; }
        bool DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        List<int> Sequences { get; set; }
        List<StatusList> Statuses { get; set; }
        int StatusId { get; set; }
    }
}