using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationTypeCreateGetWithErrorMessages
    {
        [Key]
        public PersonRelationTypeCreateGet PersonRelationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
