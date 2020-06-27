namespace SIPx.Shared
{
    public interface IProcessTemplateCreatePost
    {
        string Description { get; set; }
        bool HideEverywhere { get; set; }
        bool IsPersonal { get; set; }
        int LanguageID { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessMultiMax { get; set; }
        int ProcessTemplateGroupID { get; set; }
        int Sequence { get; set; }
        bool ShowInEventCalendar { get; set; }
        bool ShowInNew { get; set; }
        bool ShowInPersonalCalendar { get; set; }
        bool ShowInReports { get; set; }
        bool ShowInSearch { get; set; }
        string UserID { get; set; }
    }
}