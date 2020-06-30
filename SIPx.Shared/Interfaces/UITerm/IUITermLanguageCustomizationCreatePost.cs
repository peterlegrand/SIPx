namespace SIPx.Shared
{
    public interface IUITermLanguageCustomizationCreatePost
    {
        string Customization { get; set; }
        int LanguageId { get; set; }
        int UITermId { get; set; }
    }
}