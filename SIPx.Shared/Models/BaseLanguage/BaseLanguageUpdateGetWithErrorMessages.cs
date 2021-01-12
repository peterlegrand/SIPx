using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class BaseLanguageUpdateGetWithErrorMessages
    {
        [Key]
        public BaseLanguageUpdateGet BaseLanguage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
