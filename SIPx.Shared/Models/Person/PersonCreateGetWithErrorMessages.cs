using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonCreateGetWithErrorMessages
    {
        [Key]
        public PersonCreateGet Person { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
