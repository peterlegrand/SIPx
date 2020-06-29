namespace SIPx.Shared
{
    public interface IClassificationUpdatePut
    {
        int ClassificationLanguageId { get; set; }
        int DefaultPageId { get; set; }
        string Description { get; set; }
        int DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        string MenuName { get; set; }
        string ModifierId { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int StatusId { get; set; }
    }
}