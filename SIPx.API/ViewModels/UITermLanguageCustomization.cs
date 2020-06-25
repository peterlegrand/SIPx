using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class UITermLanguageCustomization
    {
        [Key]
        public int UITermID { get; set; }
        [Key]
        public int LanguageID { get; set; }
        public string Customization { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MouseOver { get; set; }
        public string InternalName { get; set; }
    }
}
