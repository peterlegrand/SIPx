using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UITermLanguageCustomizationEditGet : IUITermLanguageCustomizationEditGet
    {
        [Key]
        public int UITermLanguageCustomizationId { get; set; }
        public int UITermId { get; set; }
        public int LanguageId { get; set; }
        public string Customization { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
