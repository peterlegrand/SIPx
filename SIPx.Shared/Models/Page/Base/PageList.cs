using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageList
    {
        [Key]
        public int PageId { get; set; }
        public string Name { get; set; }
    }
}
