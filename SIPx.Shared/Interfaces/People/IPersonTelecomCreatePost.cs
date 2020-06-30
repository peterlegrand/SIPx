namespace SIPx.Shared
{
    public interface IPersonTelecomCreatePost
    {
        string AreaCode { get; set; }
        string AskFor { get; set; }
        string CountryCode { get; set; }
        string ExtensionCode { get; set; }
        int PersonId { get; set; }
        int TelecomTypeId { get; set; }
        string TelecomValue { get; set; }
        string UserId { get; set; }
    }
}