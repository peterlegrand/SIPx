namespace SIPx.Shared
{
    public interface IOrganizationTelecomCreatePost
    {
        string AreaCode { get; set; }
        string AskFor { get; set; }
        string CountryCode { get; set; }
        string ExtensionCode { get; set; }
        int OrganizationID { get; set; }
        int TelecomTypeID { get; set; }
        string TelecomValue { get; set; }
        string UserId { get; set; }
    }
}