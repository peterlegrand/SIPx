namespace SIPx.Shared
{
    public interface IOrganizationTypeCreatePost
    {
        string Description { get; set; }
        bool Internal { get; set; }
        int LanguageID { get; set; }
        bool LegalEntity { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string UserId { get; set; }
    }
}