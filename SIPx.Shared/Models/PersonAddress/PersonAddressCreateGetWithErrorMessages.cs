using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonAddressCreateGetWithErrorMessages
    {
        [Key]
        public PersonAddressCreateGet PersonAddress { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
