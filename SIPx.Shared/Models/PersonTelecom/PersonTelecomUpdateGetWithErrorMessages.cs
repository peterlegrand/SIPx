using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTelecomUpdateGetWithErrorMessages
    {
        [Key]
        public PersonTelecomUpdateGet PersonTelecom { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
