using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomizationCreatePost : IUITermLanguageCustomizationCreatePost
    {
        [Key]
        public int UITermId { get; set; }
        public int LanguageId { get; set; }
        public string Customization { get; set; }
    }
}
