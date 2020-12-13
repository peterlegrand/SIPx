using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationCreateGetWithErrorMessages
    {
        [Key]
        public PersonRelationCreateGet PersonRelation { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
