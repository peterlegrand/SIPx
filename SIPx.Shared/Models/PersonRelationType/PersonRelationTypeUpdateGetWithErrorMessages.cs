using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationTypeUpdateGetWithErrorMessages
    {
        [Key]
        public PersonRelationTypeUpdateGet PersonRelationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
