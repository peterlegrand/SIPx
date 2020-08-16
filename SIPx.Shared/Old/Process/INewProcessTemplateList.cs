namespace SIPx.Shared
{
    public interface INewProcessTemplateList
    {
        string Name { get; set; }
        int ProcessTemplateGroupId { get; set; }
        int ProcessTemplateId { get; set; }
    }
}