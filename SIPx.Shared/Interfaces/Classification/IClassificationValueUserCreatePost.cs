namespace SIPx.Shared
{
    public interface IClassificationValueUserCreatePost
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        int ClassificationValueId { get; set; }
        string UserId { get; set; }
        string UserOfClassificationId { get; set; }
    }
}