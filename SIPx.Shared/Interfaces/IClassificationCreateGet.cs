using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IClassificationCreateGet
    {
        string Description { get; set; }
        bool DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        int LanguageId { get; set; }
        string LanguageName { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        List<ClassificationCreateGetSequence> Sequences { get; set; }
        List<StatusList> Statuses { get; set; }
        int StatusId { get; set; }
    }
}