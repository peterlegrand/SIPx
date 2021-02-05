using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTypeEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        bool HideEverywhere { get; set; }
        bool IsPersonal { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessMultiMax { get; set; }
        int ProcessTypeGroupId { get; set; }
        List<ProcessTypeGroupList> ProcessTypeGroups { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeLanguageId { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
        bool ShowInEventCalendar { get; set; }
        bool ShowInNew { get; set; }
        bool ShowInPersonalCalendar { get; set; }
        bool ShowInReports { get; set; }
        bool ShowInSearch { get; set; }
    }
}