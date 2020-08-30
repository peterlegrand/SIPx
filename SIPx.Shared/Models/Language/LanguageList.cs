using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class LanguageList 
    {
        [Key]
        public int LanguageId { get; set; }
        public string Name { get; set; }

    }
}
