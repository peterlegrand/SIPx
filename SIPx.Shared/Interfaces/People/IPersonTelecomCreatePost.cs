namespace SIPx.Shared
{
    public interface IPersonTelecomCreatePost
    {
        string AreaCode { get; set; }
        string AskFor { get; set; }
        string CountryCode { get; set; }
        string ExtensionCode { get; set; }
        int PersonID { get; set; }
        int TelecomTypeID { get; set; }
        string TelecomValue { get; set; }
        string UserId { get; set; }
    }
}