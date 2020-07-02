using System;

namespace SIPx.Shared
{
    public interface IUITermLanguageCustomizationEditGet
    {
        string Customization { get; set; }
        string Description { get; set; }
        int LanguageId { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int UITermId { get; set; }
        int UITermLanguageCustomizationId { get; set; }
    }
}