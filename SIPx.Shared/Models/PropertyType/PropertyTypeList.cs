using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyTypeList 
    {
        [Key]
        public int PropertyTypeId { get; set; }
        public string Name { get; set; }
    }
}
