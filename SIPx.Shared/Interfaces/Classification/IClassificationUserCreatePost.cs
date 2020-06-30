namespace SIPx.Shared
{
    public interface IClassificationUserCreatePost
    {
        int ClassificationId { get; set; }
        int ClassificationRelationTypeId { get; set; }
        string UserId { get; set; }
        string UserOfClassificationId { get; set; }
    }
}