using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationUpdateGetWithErrorMessages
    {
        [Key]
        public PersonRelationUpdateGet PersonRelation { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
