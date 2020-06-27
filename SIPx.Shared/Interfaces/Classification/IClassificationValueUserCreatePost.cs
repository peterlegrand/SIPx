namespace SIPx.Shared
{
    public interface IClassificationValueUserCreatePost
    {
        int ClassificationID { get; set; }
        int ClassificationRelationTypeID { get; set; }
        int ClassificationValueID { get; set; }
        string UserId { get; set; }
        string UserOfClassificationID { get; set; }
    }
}