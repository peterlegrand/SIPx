using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentList
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
    }
}
