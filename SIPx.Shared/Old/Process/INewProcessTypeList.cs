namespace SIPx.Shared
{
    public interface INewProcessTypeList
    {
        string Name { get; set; }
        int ProcessTypeGroupId { get; set; }
        int ProcessTypeId { get; set; }
    }
}