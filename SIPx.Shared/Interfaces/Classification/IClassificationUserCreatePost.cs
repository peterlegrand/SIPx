namespace SIPx.Shared
{
    public interface IClassificationUserCreatePost
    {
        int ClassificationID { get; set; }
        int ClassificationRelationTypeID { get; set; }
        string UserId { get; set; }
        string UserOfClassificationID { get; set; }
    }
}