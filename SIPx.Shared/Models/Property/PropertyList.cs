using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyList 
    {
        [Key]
        public int PropertyId { get; set; }
        public string Name { get; set; }
    }
}
