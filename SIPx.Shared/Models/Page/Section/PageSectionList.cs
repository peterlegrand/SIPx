using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionList
    {
        [Key]
        public int PageSectionId { get; set; }
        public string Name { get; set; }
    }
}
