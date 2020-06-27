namespace SIPx.Shared
{
    public interface IUITermLanguageCustomizationCreatePost
    {
        string Customization { get; set; }
        int LanguageID { get; set; }
        int UITermID { get; set; }
    }
}