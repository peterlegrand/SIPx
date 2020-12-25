using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class LanguageUpdateGetWithErrorMessages
    {
        [Key]
        public LanguageUpdateGet Language { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
