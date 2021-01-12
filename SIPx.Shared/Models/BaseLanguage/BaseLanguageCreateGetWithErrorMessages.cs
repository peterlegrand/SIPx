using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class BaseLanguageCreateGetWithErrorMessages
    {
        [Key]
        public BaseLanguageCreateGet BaseLanguage { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
