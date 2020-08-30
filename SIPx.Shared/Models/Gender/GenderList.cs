using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class GenderList
    {
        [Key]
        public int GenderId { get; set; }
        public string Name { get; set; }

    }
}
