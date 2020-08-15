using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class IconList
    {
        [Key]
        public int IconId { get; set; }
        public string Name { get; set; }

    }
}
