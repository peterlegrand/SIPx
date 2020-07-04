namespace SIPx.Shared
{
    public interface IClassificationValueList
    {
        int ClassificationId { get; set; }
        int ClassificationValueId { get; set; }
        string Name { get; set; }
    }
}