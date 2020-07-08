using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class CountryList
    {
        [Key]
        public int CountryId { get; set; }
        public string Name { get; set; }

    }
}
