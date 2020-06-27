using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomizationCreatePost : IUITermLanguageCustomizationCreatePost
    {
        [Key]
        public int UITermID { get; set; }
        public int LanguageID { get; set; }
        public string Customization { get; set; }
    }
}
