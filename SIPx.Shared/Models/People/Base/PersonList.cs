using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonList
    {
        [Key]
        public int PersonId { get; set; }
        public string Name { get; set; }

    }
}
