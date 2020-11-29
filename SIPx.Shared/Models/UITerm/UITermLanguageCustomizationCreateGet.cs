using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomizationCreateGet
    {
        [Key]
        public int UITermId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Customization { get; set; }
        public string UserId { get; set; }
    }
}
