namespace SIPx.Shared
{
    public interface INewProcessTemplateList
    {
        string Name { get; set; }
        int ProcessTemplateGroupID { get; set; }
        int ProcessTemplateID { get; set; }
    }
}