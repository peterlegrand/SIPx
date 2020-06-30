using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomizationList : IUITermLanguageCustomizationList
    {
        [Key]
        public string InternalName { get; set; }
        public string TermString { get; set; }
    }
}
