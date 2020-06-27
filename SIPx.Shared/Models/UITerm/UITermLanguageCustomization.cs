using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomization : IUITermLanguageCustomization
    {
        [Key]
        public string InternalName { get; set; }
        public string TermString { get; set; }
    }
}
