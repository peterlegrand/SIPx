using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonPositionUpdateGetWithErrorMessages
    {
        [Key]
        public PersonPositionUpdateGet PersonPosition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
