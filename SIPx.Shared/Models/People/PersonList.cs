using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonList
    {
        [Key]
        public string PersonId { get; set; }
        public string Name { get; set; }

    }
}
