using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTypeUpdateGetWithErrorMessages
    {
        [Key]
        public PersonTypeUpdateGet PersonType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
