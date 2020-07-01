using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class SortByList
    {
        [Key]
        public int SortById { get; set; }
        public string Name { get; set; }

    }
}
