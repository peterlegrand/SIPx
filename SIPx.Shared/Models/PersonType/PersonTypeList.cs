using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTypeList
    {
        [Key]
        public int PersonTypeId { get; set; }
        public string Name { get; set; }

    }
}
